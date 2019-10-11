+++
title = "Training a deep policy gradient-based neural network with asynchronous learners on a simulated robotic problem"
date = 2017-09-15
draft = false

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Winfried Lötzsch", "Julien Vitay", "Fred H. Hamker"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference proceedings
# 2 = Journal
# 3 = Work in progress
# 4 = Technical report
# 5 = Book
# 6 = Book chapter
publication_types = ["1"]

# Publication name and optional abbreviated version.
publication = "In 47. Jahrestagung der Gesellschaft für Informatik e.V. (GI), Chemnitz (Germany)"
publication_short = ""

# Abstract and optional shortened version.
abstract = "Recent advances in deep reinforcement learning methods have attracted a lot of attention, because of their ability to use raw signals such as video streams as inputs, instead of pre-processed state variables. However, the most popular methods (value-based methods, e.g. deep Q-networks) focus on discrete action spaces (e.g. the left/right buttons), while realistic robotic applications usually require a continuous action space (for example the joint space). Policy gradient methods, such as stochastic policy gradient or deep deterministic policy gradient, propose to overcome this problem by allowing continuous action spaces. Despite their promises, they suffer from long training times as they need huge numbers of interactions to converge. In this paper, we investigate in how far a recent asynchronously parallel actor-critic approach, initially proposed to speed up discrete RL algorithms, could be used for the continuous control of robotic arms. We demonstrate the capabilities of this end-to-end learning algorithm on a simulated 2 degrees-of-freedom robotic arm and discuss its applications to more realistic scenarios."
abstract_short = ""

# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
featured = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
#   E.g. `projects = ["deep-learning"]` references `content/project/deep-learning.md`.
projects = ["ReinforcementLearning"]

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []

# Links (optional).
url_pdf = "pdf/Loetzsch2017.pdf"
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
# url_custom = [{name = "Custom Link", url = "http://example.org"}]

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
