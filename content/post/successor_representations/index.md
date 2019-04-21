+++
title = "Successor Representations"
subtitle = ""

# Add a summary to display on homepage (optional).
summary = "Successor representations (SR) attract a lot of attention these days, both in the neuroscientific and machine learning / deep RL communities. This post is intended to explain the main difference between SR and model-free / model-based RL algorithms and to point out its usefulness to understand goal-directed behavior."

date = 2019-03-25T07:32:46+01:00
draft = true

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Julien Vitay"]

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["Reinforcement Learning", "Machine Learning", "Dopamine"]
categories = []

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects = ["dopamine", "reinforcement-learning"]

math = true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Smart"
+++

Successor representations (SR) attract a lot of attention these days, both in the neuroscientific and machine learning / deep RL communities. This post is intended to explain the main difference between SR and model-free / model-based RL algorithms and to point out its usefulness to understand goal-directed behavior.

{{% toc %}}

## 1 - Motivation

### 1.1 - Model-free vs. model-based RL

There are two main families of **reinforcement learning** (RL; Sutton and Barto, 2017) algorithms:

* **Model-free** (MF) methods estimate the value of a state $V^\pi(s)$ or of a state-action pair $Q^\pi(s, a)$ by sampling trajectories and averaging the obtained returns, or by estimating the Bellman equations:

<div>
$$V^\pi(s_t) = \mathbb{E}_{\pi} [\sum_{k=0} \gamma^k \, r_{t+k+1}] = \mathbb{E}_{\pi} [r_{t+1} + \gamma \, V^\pi(s_{t+1})]$$
</div>

<div>
$$Q^\pi(s_t, a_t) = \mathbb{E}_{\pi} [\sum_{k=0} \gamma^k \, r_{t+k+1}] = \mathbb{E}_{\pi} [r_{t+1} + \gamma \, Q^\pi(s_{t+1}, a_{t+1})]$$
</div>


* **Model-based** (MB) methods use (or learn) a model of the environment - transition probabilities $p(s\_{t+1} | s\_t, a\_t)$ and reward probabilities $r(s\_t, a\_t, s\_{t+1})$ - and use it to plan trajectories maximizing the theoretical return, either through some form of forward planning (search tree) or using dynamic programming (solving the Bellman equations directly).

<div>
$$\pi^* = \text{argmax}_{\pi} \; p(s_0) \, \sum_{t=0}^\infty \gamma^t \, p(s_{t+1} | s_t, a_t) \, \pi(s_t, a_t) \, r(s_t, a_t, s_{t+1})$$
</div>

<div>
$$V^*(s_t) = \max_a \sum_{s'} p(s' | s_t, a) \, (r(s_t, a, s')+ \gamma \, V^*(s'))$$
</div>

The main advantage of model-free methods is their speed: they *cache* the future of the system into value functions. When having to take a decision at time $t$, we only need to look at the action with the highest Q-value in the state $s\_t$ and take it. If the Q-values are optimal, this is the optimal policy. Oppositely, model-based algorithms have to plan sequentially in the state-action space, what can be very long if the problem has a long temporal horizon.

The main drawback of MF methods is their *inflexibility* when the reward distribution changes. When the reward associated to a transition changes (the source of reward has vanished, its nature has changed, the rules of the game have changed, etc), each action leading to that transition has to be experienced multiple times before the corresponding values reflect that change. This is due to the use of the **temporal difference** (TD) algorithm, where the **reward prediction error** (RPE) is used to update values:

<div>$$\delta_t = r_{t+1} + \gamma \, V^\pi(s_{t+1}) - V^\pi(s_t)$$</div>

<div>$$\Delta V^\pi(s_t) = \alpha \, \delta_t$$</div>

When the reward associated to a transition changes drastically, only the last state (or action) is updated after that experience (unless we use eligibility traces). Only multiple repetitions of the same trajectory would allow to change the initial decisions. This is opposite to MB methods, where a change in the reward distribution would very quickly influence the planning of the optimal trajectory. In MB, the reward probabilities can be estimated with:

<div>$$
    \Delta r(s_t, a_t, s_{t+1}) = \alpha \, (r_{t+1} - r(s_t, a_t, s_{t+1}))
$$
</div>

with $r_{t+1}$ being the reward obtained during one sampled transition. The transition probabilities can also be learned from experience using:

<div>$$
    \Delta p(s' | s_t, a_t) = \alpha \, (\mathbb{I}(s_{t+1} = s') - p(s' | s_t, a_t))
$$
</div>

where $\mathbb{I}(b)$ is 1 when $b$ is true, 0 otherwise. Depending on the learning rate, changes in the environment dynamics can be very quickly learned by MB methods, as updates do not depend on other estimates (there is no bootstrapping contrary to TD).

### 1.2 - Goal-directed behavior vs. habits

The model-free RPE has become a very influential model of dopaminergic (DA) activation in the ventral tegmental area (VTA) and substantia nigra pars compacta (SNc). At the beginning of classical Pavlovian conditioning, DA cells react phasically to unconditioned stimuli (US, rewards). After enough conditioning trials, DA cells only react to conditioned stimuli (CS), i.e. stimuli which predict the delivery of a reward. Moreover, if the reward is omitted, DA cells exhibit a pause in firing. This pattern of activation corresponds to the RPE: DA cells respond to unexpected reward event, either positively when more reward than expected is received, or negatively when less reward is delivered. The simplicity of this model has made RPE a successful model of DA activity (but see Vitay and Hamker, 2014).

A similar but not identical functional dichotomy as MF/MB opposes deliberative **goal-directed** behavior and inflexible stimulus-response **habits** (Dickinson and Balleine, 2002). Goal-directed behavior is sensitive to reward devaluation: if an outcome was previously rewarding but ceases to be (for example, a poisonous product is injected into some food reward, even outside the conditioning phase), goal-directed behavior would quickly learn to avoid that outcome, while habitual behavior will continue to seek for it. Over-training can transform goal-directed behavior into habits (Corbit and Balleine, 2011). Habits are usually considered as a model-free learning behavior, while goal-directed behavior implies the use of a world model. The *dual system theory* discusses the arbitration mechanisms necessary to coordinate these two learning frameworks (Lee, Shimojo and O'Doherty, 2014).

Both forms of behavior are thought to happen concurrently in the brain, with model-based / goal-directed behavior classically assigned to the prefrontal cortex and the hippocampus and model-free / habitual behavior mapped to the ventral basal ganglia and the dopaminergic system.  However, recent results and theories suggest that these two functional systems are largely overlapping and that even dopamine firing might reflect model-based processes (Doll, Simon and Daw, 2012; Miller et al., 2018). It is yet to be understood how these two extreme mechanisms of the RL spectrum might coexist in the brain and be coordinated: successor representations might provide us with useful insights into the functioning of the brain.

## 2 - Successor representations in reinforcement learning

### 2.1 - Main idea

The original formulation of **successor representations** (SR) is actually not recent (Dayan, 1993), but it is subject to a revival since a couple of years with the work of Samuel J. Gershman (e.g. Gershman et al., 2012, 2018, Momennejad et al., 2017, Stachenfeld et al., 2017, Gardner et al, 2018).

The SR algorithm learns two quantities:

1. The expected immediate reward received after each state:

<div>$$
    r(s) = \mathbb{E}_{\pi} [r_{t+1} | s_t = s]
$$
</div>

2. The expected discounted future state occupancy (the **SR** itself):

<div>$$
    M(s, s') = \mathbb{E}_{\pi} [\sum_{k=0}^\infty \gamma^k \, \mathbb{I}(s_{t+k+1} = s') | s_t = s]
$$
</div>

I omit here the dependency of $r$ and $M$ on the policy itself in the notation, but it is of course implicitly there.

The SR represents the fact that a state $s'$ can be reached after $s$, with a value decreasing with the temporal gap between the two states: states occurring in rapid succession will have a high SR, very distant states will have a low SR. If $s'$ happens consistently before $s$, the SR should be 0 (causality principle). This is in principle similar to model-based RL, but without an explicit representation of the transition structure: it only represents how states are temporally correlated, not which action leads to which state.

The value of a state $s$ is then defined by:

<div>$$
    V^\pi(s) = \sum_{s'} M(s, s') \, r(s')
$$
</div>

The value of a state $s$ depends on which states $s'$ can be visited after it (following the current policy, implicitly), how far in the future they will happen (discount factor in $M(s, s')$) and how much reward can be obtained immediately in those states ($r(s')$). Note that it is merely a rewriting of the definition of the value of a state, with rewards explicitly separated from state visitation and time replaced by succession probabilities:

<div>$$V^\pi(s_t) = \mathbb{E}_{\pi} [\sum_{k=0} \gamma^k \, r_{t+k+1}] = \mathbb{E}_{\pi} [\sum_{k=0} r(s_{t+k+1}) \times (\gamma^k \, \mathbb{I}(s_{t+k+1}))]$$</div>

The SR also obeys a recursive relationship similar to the Bellman equation, as it is based on a discounted sum:

<div>$$
    M(s_t, s') = \mathbb{I}(s_t = s') + \gamma \, M(s_{t+1}, s')
$$
</div>

The discounted probability of arriving in $s'$ after being in $s\_t$ is one if we are already in $s'$, and gamma times the discounted probability of arriving in $s'$ after being in the next state $s\_{t+1}$ otherwise.

This recursive relationship implies that we are going to be able to estimate the SR $M(s, s')$ using a **sensory prediction error** (SPE) similar to the TD RPE (Gershman et al., 2012):

<div>$$
    \delta^\text{SR}_t = \mathbb{I}(s_t = s') + \gamma \, M(s_{t+1}, s') - M(s_t, s')
$$
</div>

<div>
$$
    \Delta M(s_t, s') = \alpha \, \delta^\text{SR}_t
$$
</div>

The SPE states that the expected occupancy for states that are visited more frequently than expected (positive sensory prediction error) should be increased, while the expected occupancy for states that are visited less frequently than expected (negative sensory prediction error) should be decreased. In short: is arriving in this new state surprising? It should be noted that the SPE is defined over all possible successor states $s'$, so the SPE is actually a vector.

We can already observe that SR is a trade-off between MF and MB methods. A change in the reward distribution can be quickly tracked by SR algorithms, as the immediate reward $r(s)$ can be updated with:

<div>$$
    \Delta r(s) = \alpha \, (r_{t+1} - r(s))
$$</div>

However, the SR $M(s, s')$ uses other estimates for its update (bootstrapping), so changes in the transition structure may take more time to propagate to all state-state discounted occupancies (Gershman, 2018). We will discuss the implications of this fact on the biological plausibility of the SR algorithm in a later section.

### 2.2 - Linear function approximation

But before, we need to deal with the **curse of dimensionality**. The SR $M(s, s')$ is a matrix associating each state of the system to every other states. This is of course impracticable for most problems and we need to rely on function approximation. The simplest solution is to represent each state $s$ by a set of $d$ features $[f\_i(s)]\_{i=1}^d$. Each feature can for example be the presence of an object in the scene, some encoding of the position of the agent in the world, etc. The SR for a state $s$ only needs to predict the expected discounted probability that a feature $f_j$ will be observed in the future, not the complete state representation. This should ensure generalization across states, as only the presence of relevant features is needed. The SR can be linearly approximated by:

<div>$$
    M_j(s) = \sum_{i=1}^d w_{i, j} \, f_i(s)
$$</div>

The expected discounted probability of observing the feature $f\_j$ in the future is defined as a weighted sum of the features of the state $s$. The value of a state is now defined as:

<div>$$
    V^\pi(s) = \sum_{j=1}^d M_j(s) \, r(f_j) = \sum_{j=1}^d r(f_j) \, \sum_{i=1}^d w_{i, j} \, f_i(s)
$$</div>

where $r(f\_j)$ is the expected immediate reward when observing the feature $f\_j$, what can be easily tracked as before. Computing the value of a state based on the SR now involves a double sum over a $d \times d$ matrix, $d$ being the number of features, what should generally be much more tractable than over the total number of states squared.

As we use linear approximation, the learning rule for the weights $w\_{i, j}$ becomes linearly dependent on the SPE:

<div>$$
    \delta^\text{SR}_t(f_j) = f_j(s_t) + \gamma \, M_j(s_{t+1}) - M_j(s)
$$</div>


<div>$$
    \Delta w_{i, j} = \alpha \, \delta^\text{SR}_t(f_j) \, f_i(s_t)
$$</div>

The SPE tells us how surprising is each feature $f\_j$ when being in the state $s_t$. This explain the term *sensory prediction error*: we are now not learning based on how surprising rewards are anymore, but on how surprising sensory features are. Did I expect that door to open at some point? Should this event happen soon? What kind of outcome is likely to happen? As the SPE is now a vector for all sensory features, we see why successor representation have a great potential: instead of a single scalar RPE dealing only with reward magnitudes, we now can learn from very diverse representations describing the various relevant dimensions of the task. It can furthermore deal with different rewards: food and monetary rewards are treated the same by RPEs, while we can distinguish them with SPEs.

The main potential problem is of course to extract the relevant features for the task, either by hand-engineering them or through learning (one could work in the latent space of a variational autoencoder, for example). Feature-based state representations still have to be Markovian for SR to work. It is also possible to use non-linear function approximators such as deep networks (Kulkarni et al., 2016, Baretto et al., 2016, Zhang et al., 2016, Machado et al., 2018, Ma et al., 2018), but this is out of the scope of this post.


### 2.3 - Successor representations of actions

The previous sections focused on the successor representation of states to obtain the value function $V^\pi(s)$. The same idea can be be applied to state-action pairs and their $Q^\pi(s, a)$ values. The Q-value of a state action pair can be defined as:

<div>$$
    Q^\pi(s, a) = \sum_{s', a'} M(s, a, s', a') \, r(s', a')
$$</div>

where $r(s', a')$ is the expected immediate reward obtained after $(s', a')$ and $M(s, a, s', a')$ is the SR between the pairs $(s, a)$ and $(s', a')$ as in (Momennejad et al., 2017). Ducarouge and Sigaud (2017) use a SR representation between a state-action pair $(s, a)$ and a successor state $s'$:

<div>$$
    Q^\pi(s, a) = \sum_{s'} M(s, a, s') \, r(s')
$$</div>

In both cases, the SR can be learned using a sensory prediction error, such as:

<div>$$
    \delta^\text{SR}_{s_t, a_t} = \mathbb{I}(s_t = s') + \gamma \, M(s_{t+1}, a_{t+1}, s') - M(s_t, a_t, s')
$$
</div>

Note that eligibility traces can be used in SR learning as easily as in TD methods.

## 3 - Successor representations in neuroscience

### 3.1 - Human goal-directed behavior

So great, we now have a third form of reinforcement learning. Could it be the missing theory to explain human reinforcement learning and the dichotomy goal-directed behavior / habits?

Momennejad et al. (2017) designed a two-steps sequential learning task with reward and transition revaluations. In the first learning phase, the subjects are presented with sequences of images (the states) and obtain different rewards (Fig. 1). The sequence $1 \rightarrow 3 \rightarrow 5$ is rewarded with 10 dollars while the sequence $2 \rightarrow 4 \rightarrow 6$ is rewarded with 1 dollar only. Successful learning is tested by asking the participant whether he/she prefers the states 1 or 2 (the answer is obviously 1).

{{< figure src="sr_momennejad.svg" title="Two-steps sequential learning task of Momennejad et al. (2017)." numbered="true" >}}

In the reward revaluation task, the transitions $3 \rightarrow 5$ and $4 \rightarrow 6$ are experienced again in the re-learning phase, but this time with reversed rewards (1 and 10 dollars respectively). In the transition revaluation task, the transitions $3 \rightarrow 6$ and $4 \rightarrow 5$ are now experienced, but the states $5$ and $6$ still receive the same amount of reward. The preference for $1$ or $2$ is again tested at the end of the re-learning phase ($2$ should now be preferred in both tasks) and a revaluation score is computed (how much the subject changes his preference between the two phases).

What would the different ML methods predict?

* Model-free methods would not change their preference in both conditions. The value of the $3 \rightarrow 5$ and $4 \rightarrow 6$ transitions (reward revaluation) or $3 \rightarrow 6$ and $4 \rightarrow 5$ (transition revaluation) would change during the re-learning phase, but the transitions $1 \rightarrow 3$ and $2 \rightarrow 4$ are never experienced, so the value of the states $1$ and $2$ can only stay the same, even with eligibility traces.

* Model-based methods would change their preference in both conditions. The reward and transition probabilities would both be re-learned completely to reflect the change, so the new value of $1$ and $2$ can be computed correctly using dynamic programming.

* Successor representation methods would adapt to the reward revaluation ($r(s)$ will quickly fit the new reward distribution for the states $5$ and $6$), but not to the transition revaluation: $6$ is never a successor state of $1$ in the re-learning phase, so the SR matrix will not be updated for the states $1$ and $2$.

We have three different mechanisms with testable predictions on these two tasks: the human experiments should tell us which method is the best model of human RL. Well... Not really.

{{< figure src="sr_results.png" title="Revaluation score in the reward (red) and transition (blue) revaluation conditions for the model-free (MF), model-based (MB), successor representation (SR) and human data as reported in Momennejad et al. (2017)." numbered="true" >}}

Human participants show a revaluation behavior in the two conditions (reward and transition) somehow in between the model-based and successor representation algorithms. The difference between the reward and transition conditions is statistically significant, so unlike MB, but not as dramatic as for SR. The authors propose a hybrid SR-MB model, linearly combining the outputs of the MB and SR algorithms, and fit it to the human data to obtain a satisfying match. A second task requiring he model to actually take actions confirms this observation.

It is hard to conclude anything definitive from this model and the somehow artificial fit to the data. Reward revaluation was the typical test to distinguish between MB and MF, or between goal-directed behavior and habits. This paper suggests that transition revaluation (and policy revaluation, investigated in the second experiment) might allow to distinguish between MB and SR mechanisms, supporting the existence of SR mechanisms in the brain. How MB and SR might interact in the brain and whether there is an arbitration mechanism between the two is still an open issue. (Russek et al., 2017) has a very interesting discussion on the link between MF and MB processes in the brain, based on different versions of the SR.

### 3.2 - Neural substrates of successor representations

In addition to describing human behavior at the functional level, the SR might also allow to better understand the computations made by the areas involved in goal-directed behavior, in particular the basal ganglia, the dopaminergic system and the hippocampus. The key idea of Gershman and colleagues is that the SR $M(s, s')$ might be encoded in the place cells of the hippocampus (Stachenfeld et al., 2017), which are critical to reward-based navigation. The sensory prediction error (SPE $\delta^\text{SR}\_t$) might be encoded in the activation of the dopaminergic cells in VTA, driving learning of the SR in the hippocampus (Gardner et al., 2018), while the value of a state $V^\pi(s) = \sum_{s'} M(s, s') \, r(s')$ could be computed either in the prefrontal cortex (ventromedial or orbitofrontal) or in the ventral striatum (nucleus accumbens in rats), ultimately allowing action selection in the dorsal BG.



#### Dopamine as a SPE

Feature-specific prediction errors and surprise across macaque fronto-striatal circuits (Oemisch et al., 2019)

#### Hippocampus as a predictive map

(Stachenfeld et al., 2017)

#### Open questions

* How does the SPE in VTA reach the hippocampus? Directly?
* Is the hippocampus able to learn from SPE?
* Forward replays allow NAcc to compute V(s)?
* DA = vector?

## Discussion

## References

Barreto, A., Dabney, W., Munos, R., Hunt, J. J., Schaul, T., van Hasselt, H., et al. (2016). Successor Features for Transfer in Reinforcement Learning. arXiv:1606.05312. Available at: http://arxiv.org/abs/1606.05312.

Corbit, L. H., and Balleine, B. W. (2011). The general and outcome-specific forms of Pavlovian-instrumental transfer are differentially mediated by the nucleus accumbens core and shell. The Journal of neuroscience 31, 11786–94. doi:10.1523/JNEUROSCI.2711-11.2011.

Dayan, P. (1993). Improving Generalization for Temporal Difference Learning: The Successor Representation. Neural Computation 5, 613–624. doi:10.1162/neco.1993.5.4.613.

Dickinson, A., and Balleine, B. (2002). The role of learning in the operation of motivational systems. In: Gallistel CR, editor. Steven’s handbook of experimental psychology: learning, motivation and emotion . 3rd ed.New York: John Wiley & Sons, 497–534.

Doll, B. B., Simon, D. A., and Daw, N. D. (2012). The ubiquity of model-based reinforcement learning. Current Opinion in Neurobiology 22, 1075–1081. doi:10.1016/j.conb.2012.08.003.

Ducarouge, A., and Sigaud, O. (2017). The Successor Representation as a model of behavioural flexibility. In Journées Francophones sur la Planification, la Décision et l’Apprentissage pour la conduite de systèmes (JFPDA 2017). Caen, France. Available at: https://hal.archives-ouvertes.fr/hal-01576352.

Gardner, M. P. H., Schoenbaum, G., and Gershman, S. J. (2018). Rethinking dopamine as generalized prediction error. Proceedings of the Royal Society B: Biological Sciences 285, 20181645. doi:10.1098/rspb.2018.1645.

Gershman, S.J., Moore, C.D:, Todd, M.T., Norman, K.A., and Sederberg, P.B. (2012). The successor representation and temporal context. Neural Computation, 24(6):1553–1568, 2012.

Gershman, S. J. (2018). The Successor Representation: Its Computational Logic and Neural Substrates. The Journal of neuroscience : the official journal of the Society for Neuroscience 38, 7193–7200. doi:10.1523/JNEUROSCI.0151-18.2018.

Kulkarni, T. D., Saeedi, A., Gautam, S., and Gershman, S. J. (2016). Deep Successor Reinforcement Learning. arXiv:1606.02396. Available at: http://arxiv.org/abs/1606.02396.

Lee, S. W., Shimojo, S., and O'Doherty J. P. (2014). Neural computations underlying arbitration between model-based and model-free learning. Neuron, 81(3), 687–699. doi:10.1016/j.neuron.2013.11.028.

Ma, C., Wen, J., and Bengio, Y. (2018). Universal Successor Representations for Transfer Reinforcement Learning. arXiv:1804.03758. Available at: http://arxiv.org/abs/1804.03758.

Machado, M. C., Bellemare, M. G., and Bowling, M. (2018). Count-Based Exploration with the Successor Representation. arXiv:1807.11622. Available at: http://arxiv.org/abs/1807.11622.

Miller, K., Ludvig, E. A., Pezzulo, G., and Shenhav, A. (2018). Re-aligning models of habitual and goal-directed decision-making. In Goal-Directed Decision Making : Computations and Neural Circuits, eds. A. Bornstein, R. W. Morris, and A. Shenhav (Academic Press). Available at: https://www.elsevier.com/books/goal-directed-decision-making/morris/978-0-12-812098-9.

Momennejad, I., Russek, E. M., Cheong, J. H., Botvinick, M. M., Daw, N. D., and Gershman, S. J. (2017). The successor representation in human reinforcement learning. Nature Human Behaviour 1, 680–692. doi:10.1038/s41562-017-0180-8.

Oemisch, M., Westendorff, S., Azimi, M., Hassani, S. A., Ardid, S., Tiesinga, P., et al. (2019). Feature-specific prediction errors and surprise across macaque fronto-striatal circuits. Nature Communications 10, 176. doi:10.1038/s41467-018-08184-9.

Russek, E. M., Momennejad, I., Botvinick, M. M., Gershman, S. J., and Daw, N. D. (2017). Predictive representations can link model-based reinforcement learning to model-free mechanisms. PLoS Computational Biology, 13, e1005768. doi:10.1371/journal.pcbi.1005768

Schultz, W. (1998). Predictive reward signal of dopamine neurons. J Neurophysiol 80, 1–27.

Stachenfeld, K. L., Botvinick, M. M., and Gershman, S. J. (2017). The hippocampus as a predictive map. Nature Neuroscience 20, 1643–1653. doi:10.1038/nn.4650.

Sutton, R. S., and Barto, A. G. (2017). Reinforcement Learning: An Introduction. 2nd ed. Cambridge, MA: MIT Press. Available at: http://incompleteideas.net/book/the-book-2nd.html.

Vitay, J., and Hamker, F. H. (2014). Timing and expectation of reward: A neuro-computational model of the afferents to the ventral tegmental area. Frontiers in Neurorobotics 8. doi:10.3389/fnbot.2014.00004.

Zhang, J., Springenberg, J. T., Boedecker, J., and Burgard, W. (2016). Deep Reinforcement Learning with Successor Features for Navigation across Similar Environments. arXiv:1612.05533. Available at: http://arxiv.org/abs/1612.05533.