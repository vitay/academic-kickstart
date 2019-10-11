+++
title = "Hippocampus"
date = 2015
draft = false

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = []

# Project summary to display on homepage.
summary = "The hippocampus is a key structure for mnemonic processes (episodic memory) and spatial navigation. Its importance in model-based behavior is increasingly recognized."

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

The hippocampus is a key structure for episodic memory and spatial navigation. A fundamental step in hippocampus research was the discovery of **place cells**, which fire whenever an animal traverses a certain location known as the place field (O'Keefe and Nadel, 1978). At rest, place cells exhibit brief periods of fast oscillations termed sharp wave-ripples. During these events, place cell activity shows sequential patterns called forward replay and reverse replay: time-compressed, and sometimes time-reversed, reproductions of previously experienced sequences. Spatial experiences stored in the hippocampus can therefore be recalled at will during behavior.

Our modeling work focuses on understanding how these replay patterns are learned and used for high-level cognitive processes such as decision-making and model-based reinforcement learning.

<img style="width:80%; min-width:320px" src="/img/hippocampus/model.png" />
