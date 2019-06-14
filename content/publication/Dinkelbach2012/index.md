+++
title = "Comparison of GPU- and CPU-implementations of mean-firing rate neural networks on parallel hardware"
date = 2012-11-09
draft = false

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Helge Ü. Dinkelbach", "Julien Vitay", "Fred H. Hamker"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference proceedings
# 2 = Journal
# 3 = Work in progress
# 4 = Technical report
# 5 = Book
# 6 = Book chapter
publication_types = ["2"]

# Publication name and optional abbreviated version.
publication = "Network: Computation in Neural Systems 23(4). doi:10.3109/0954898X.2012.739292"
publication_short = ""

# Abstract and optional shortened version.
abstract = "Modern parallel hardware such as multi-core processors (CPUs) and graphics processing units (GPUs) have a high computational power which can be greatly beneficial to the simulation of large-scale neural networks. Over the past years, a number of efforts have focused on developing parallel algorithms and simulators best suited for the simulation of spiking neural models. In this article, we aim at investigating the advantages and drawbacks of the CPU and GPU parallelization of mean-firing rate neurons, widely used in systems-level computational neuroscience. By comparing OpenMP, CUDA and OpenCL implementations towards a serial CPU implementation, we show that GPUs are better suited than CPUs for the simulation of very large networks, but that smaller networks would benefit more from an OpenMP implementation. As this performance strongly depends on data organization, we analyze the impact of various factors such as data structure, memory alignment and floating precision. We then discuss the suitability of the different hardware depending on the networks' size and connectivity, as random or sparse connectivities in mean-firing rate networks tend to break parallel performance on GPUs due to the violation of coalescence."
abstract_short = ""

# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
featured = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
#   E.g. `projects = ["deep-learning"]` references `content/project/deep-learning.md`.
projects = ["annarchy"]

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []

# Links (optional).
url_pdf = "pdf/Dinkelbach2012.pdf"
url_preprint = ""
url_code = ""
url_dataset = ""
url_project = ""
url_slides = ""
url_video = ""
url_poster = ""
url_source = ""

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
doi = "10.3109/0954898X.2012.739292"

# Does this page contain LaTeX math? (true/false)
math = false

# Does this page require source code highlighting? (true/false)
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++
