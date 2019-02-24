+++
title = "Dopaminergic system"
date = 2019
draft = false

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ['computational-neuroscience']

# Project summary to display on homepage.
summary = "Modeling the dopaminergic system (VTA, SNc), its afferences and its influence on the basal ganglia, prefrontal cortex and hippocampus."

# Slides (optional).
#   Associate this page with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references
#   `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides = ""

# Optional external URL for project (replaces project detail page).
external_link = ""

# Links (optional).
url_pdf = ""
url_code = ""
url_dataset = ""
url_slides = ""
url_video = ""
url_poster = ""

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
# links = [{icon_pack = "fab", icon="twitter", name="Follow", url = "https://twitter.com"}]

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Center"
+++

The dopaminergic system is composed of the *ventral tegmental area* (VTA) and the *substantia nigra pars compacta* (SNc). The neurotransmitter **dopamine** (DA) released by neurons in these two small areas exerts a strong influence on neural excitability and plasticity in many brain areas: mostly the basal ganglia (BG), but also the prefrontal cortex, the hippocampus or the amygdala.

A striking feature of VTA cells is their response during classical (or Pavlovian) conditioning, as observed by Schultz et al (1998).  Early on, VTA cells respond phasically (a burst) to unconditioned stimuli (US, or rewards in operant conditioning). Gradually during learning, the amplitude of this response decreases, replaced by a response to the conditioned stimuli (CS) which are predictive of reward delivery. Moreover, if a reward is predicted by the CS but omitted, VTA cells show a brief depression of activity (a dip) at the time where the US was expected. This pattern resembles the temporal difference (TD) error signal used in reinforcement learning, what generated  multitudes of models based on that analogy.

What remains unclear is how VTA cells access information about the US, the CS and more importantly the time elapsed since CS onset. The goal of this research project is to investigate the mechanisms by which VTA is able to exhibit these properties, by looking at the afferent system to VTA. VTa indeed receives information from many brain areas, either directly as the rostromedial tegmental area (RMTg), the pedunculopontine nucleus (PPTN) or the nucleus accumbens (NAcc), or indirectly as the amygdala, the lateral habenula (LHb), the ventral pallidum (VP) or the ventromedial prefrontal cortex (vmPFC).

<img style="width:80%; min-width:320px" src="/img/dopamine/dopamine.jpg" />


### Publications

Julien Vitay (2017). [On the role of dopamine in motivated behavior: a neuro-computational approach](../../publication/habilitation). Habilitation (TU Chemnitz).

Julien Vitay, Fred H. Hamker (2014). [Timing and expectation of reward: a neuro-computational model of the afferents to the ventral tegmental area](../../publication/vitay2014). Front. Neurorobot. 8:4. doi:10.3389/fnbot.2014.00004.
