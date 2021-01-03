+++
title = "Basal Ganglia"
date = 2020-11-01
draft = false

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["Computational Neuroscience"]

# Project summary to display on homepage.
summary = "The Basal Ganglia (BG) are the main nuclei involved in reinforcement learning processes in the brain and allow a variety of cognitive functions such as working memory, decision making and action selection."

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

  preview_only = true
+++

The Basal Ganglia (BG) are a set of nuclei located in the basal forebrain, receiving inputs mostly from the cerebral cortex (especially the frontal lobe) and projecting on various motor centers, as well as back to the cortex through the thalamus, forming a closed-loop. 

The main input station is the striatum, which can be anatomically divided into three parts: the nucleus accumbens (NAcc), the caudate nucleus (CN) and the putamen (PUT). Striatal neurons are excited by cortical activity and inhibit in turn the tonically active neurons of the output nuclei of the BG: the substantia nigra pars reticulata (SNr) and the internal segment of the globus pallidus (GPi). These output structures further inhibit some motor centers and thalamic nuclei. 

<img style="width:80%; min-width:320px" src="/img/basalganglia/basalganglia.png" />

This double inhibition allows to selectively open some recurrent loops between the thalamus and the cortex, increasing the signal-to-noise ratio in the cortex and triggering movements or cognitive functions. 

Other nuclei in the BG, such as the subthalamic nucleus (STN) and the external part of the globus pallidus (GPe), create functionally different pathways to allow for a more complex role of BG in adapting behavior. 

The main characteristic of the BG is its dense innervation by dopaminergic (DA) cells in the substantia nigra pars compacta (SNc) and ventral tegmental area (VTA), whose firing is related to reward delivery and prediction. DA can modulate the activation and learning of most cells in the BG, placing it as a core structure in reinforcement learning processes. 

