+++
title = "Reservoir Computing"
date = 2013
draft = false

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = []

# Project summary to display on homepage.
summary = "Reservoir computing studies the dynamical properties of recurrently connected populations of neurons. Their rich dynamics allow to represent and learn complex tasks currently out of reach of the classical machine learning methods, but also allow to better understand brain activities."

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
  focal_point = ""
+++

The field of **reservoir computing**, covering Echo-State Networks (ESN; Jaeger, 2000) and Liquid State Machines (Maas, 2001), studies the dynamical properties of recurrent neural networks. Depending on the strength of the recurrent connections, the reservoirs can exhibit either deterministic or chaotic trajectories following a stimulation.

![](result.png)

These trajectories can serve as a complex temporal basis to represent events. In their early formulation, reservoirs were fixed and read-out neurons used this basis to mimic specific target signals using supervised learning.

In the recent years, methods have been developed to train the connections inside the reservoir too, either using supervised learning (e.g. Laje and Buonomano 2013) or reinforcement learning (Miconi, 2017). This unleashes the potential of reservoirs for both machine learning applications and computational neuroscience.

We study the properties of reservoir computing at the neuroscientific level, with an emphasis on reinforcement learning, forward models in the cerebellum (Schmid et al, 2019) or interval timing. 
