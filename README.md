# Academic Kickstart

**Academic** <https://themes.gohugo.io/academic/> is a framework to help you create a beautiful website quickly. Perfect for personal, student, or academic websites. [Check out the latest demo](https://academic-demo.netlify.com/) of what you'll get in less than 10 minutes or view the documentation:

<https://sourcethemes.com/academic/docs/>

**Academic Kickstart** provides a minimal template to kickstart your new website by following the simple steps below.

## Installation

* Installed with Netlify <https://app.netlify.com/>.

* View the website locally:

       hugo server

Now you can go to [localhost:1313](http://localhost:1313) and your new Academic powered website should appear.

## Make changes

Script:

    bash deploy.sh

First pick the git submodules:

    git submodule update --remote static/deeprl

Then commit:

    git commit -a
    git push origin master

Netlify will do the rest.

## Add a document

* Add a publication:

    hugo new --kind publication publication/Vitay2019

* Add a blog post:

    hugo new  --kind post post/my-article-name

## License

Copyright 2017 [George Cushen](https://georgecushen.com).

Released under the [MIT](https://github.com/sourcethemes/academic-kickstart/blob/master/LICENSE.md) license.

[![Analytics](https://ga-beacon.appspot.com/UA-78646709-2/academic-kickstart/readme?pixel)](https://github.com/igrigorik/ga-beacon)
