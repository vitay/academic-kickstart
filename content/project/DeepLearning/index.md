+++
title = "Deep Learning"
date = 2017
draft = false

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["machine-learning", "deep-learning"]

# Project summary to display on homepage.
summary = "Deep neural networks and their applications to emotion recognition, attention, sensor fusion..."

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
  focal_point = "Smart"
+++


The recent hype on **deep learning** has revived the interest for artificial neural networks and their applications. Here are some projects done lately.

## Project 1 : Facial emotion recognition

Facial expression recognition is an important research field in computer vision. Although detecting facial features is an easy task for a human, computers still have a hard time doing it. Factors such as interpersonal variation (gender, skin color), intrapersonal variation (pose, expression) and different recording conditions (image resolution, lighting) add to the complexity of the problem. This is particularly relevant in the context of emotion recognition, where systems should be able to automatically recognize in which emotional state humans are.

On human faces, emotional expression heavily relies on the activation of individual facial muscles. A classical approach to describe facial expressions at the muscular level is the Facial Action Coding System (FACS) proposed by Ekman (1978). In this framework, movement of specific facial regions are described as Actions Units (AU), which basically describe deviations from a neutral expression. AUs are specific to facial regions (corner of the mouth or the eye, etc.). Although there are 69 AUs in the FACS theory, 28 of them are mostly useful for emotion recognition. We have focused on 12 of them: 1 (Inner Brow Raiser), 2 (Outer Brow Raiser), 4 (Brow Lowerer), 6 (Cheek Raiser), 7 (Lid Tightener), 10 (Upper Lip Raiser), 12 (Lip Corner Puller), 14 (Dimpler), 15 (Lip Corner Depressor), 17 (Chin Raiser), 23 (Lip Tightener), 24 (Lip Pressor).

There are different training sets generally available to the community containing various number of FACS-annotated images, with different numbers of annotated AUs: CCK+, MMI, UNBC-McMaster PAIN, DUSFA, BP4D, SEMAINE, etc. The 12 selected AUs correspond to the annotated AUs in BP4D, which is the most massive dataset. The main interest of these AUs is that they are mostly sufficient to predict the occurence of the 6 basic emotions using the EMFACS correspondance table:

| Emotion   |  Action Units     |
| --------  |  ---------------  |
| Happiness |  6, 12            |
| Sadness   |  1, 4, 15         |
| Surprise  |  1, 2, 5B, 26     |
| Fear      |  1, 2, 4, 5, 7, 20, 26 |
| Anger     |  4, 5, 7, 23      |
| Disgust   |  9, 15, 16        |

After investigating various architectures to automatically predict AU occurence on faces, we converged towards a neural network architecture inspired from VGG-16:

{{< figure src="model.png" title="Convolutional Neural Network for FACS recognition." numbered="true" >}}

It consists of 4 convolutional blocks, each composed of 2 convolutional layers (kernel size 3x3, ReLU activation function) and a max-pooling layers (2x2). A dropout layer with p=0.2 is added after the max-pooling. After 4 such convolutional blocks with increasing numbers of features (32, 64, 126 and 256), the last tensor (6x6x256) is flattened into a vector of 9216 elements and projected on a fully connected layer of 500 neurons. The output layer has 12 neurons using the sigmoid activation function, each representing one of the 12 AUs present in the combined dataset. The network has a total of 5.786.192 trainable parameters (weights and biases), what makes it a middle-sized deep network that can fit into the available GPUs at the lab. The model was trained over 120 epochs using Stochastic Gradient Descent (SGD) on minibatches of 128 samples, with a learning rate of 0.01 and a Nesterov momentum of 0.9. The network has successfully learned the training data (final loss of 0.02) and has only very slightly overfitted. F1 scores for each AU on the test set are well over 0.9.

The video below shows the performance of the network in real conditions. The detected AUs are in the top-left corner, the recognized emotion in the bottom-left one.

{{< video src="demo.mp4" controls="yes" >}}


## Project 2 : Scene understanding

Recurrent neural networks coupled with attentional mechanisms have the ability to sequentially focus of the relevant parts of a visual scene. Coupled with a language production network, scene understanding abilities can be improved by finding the spatial location of the important objects in a scene while describing it.

The idea of the work done by Saransh Vora during his Master thesis in 2018 at the professorship was to study and reimplement the Show, attend and tell model of (Xu et al 2015, arXiv:1502.03044). The attentional signal is used to locate the most important objects of the sentence in the image, and have a Nao point at them while pronouncing the sentence.

{{< youtube dupgWkoA78c >}}

