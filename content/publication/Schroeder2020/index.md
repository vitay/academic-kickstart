---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Monocular 3D Object Detection Using Feature Map Transformation: Towards Learning Perspective-Invariant Scene Representations"
authors: ["Enrico Schröder", "Sascha Braun", "Mirko Mählisch", "Julien Vitay", "Fred H. Hamker"]
date: "2020-11-09"
doi: "10.1109/IRC.2020.00066"

# Schedule page publish date (NOT publication's date).
publishDate: 2021-01-03T10:28:30+01:00

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "2020 Fourth IEEE International Conference on Robotic Computing (IRC)"
publication_short: "IRC"

abstract: "In this paper we propose to use a feature map transformation network for the task of monocular 3D object detection. Given a monocular camera image, the transformation network encodes features of the scene in an abstract, perspective-invariant latent representation. This latent representation can then be decoded into a bird's-eye view representation to estimate objects' position and rotation in 3D space. In our experiments on the Kitti object detection dataset we show that our model is able to learn to estimate objects' 3D position from a monocular camera image alone without having any explicit geometric model or other prior information on how to perform the transformation. While performing slightly worse than networks which are purpose-built for this task, our approach allows feeding the same bird's-eye view object detection network with input data from different sensor modalities. This can increase redundancy in a safety-critical environment. We present additional experiments to gain insight into the properties of the learned perspective-invariant abstract scene representation."

# Summary. An optional shortened abstract.
summary: ""

tags: []
categories: ["DeepLearning"]
featured: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_pdf:
url_code:
url_dataset:
url_poster:
url_project:
url_slides:
url_source:
url_video:

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: ["DeepLearning"]

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
