# [GitBlog2](https://github.com/HenriTEL/gitblog2), my minimalist blog generator

> How I spent weekends developping a blogging platform instead of actually starting a blog.

![Rabbit holing](/media/rabbit-hole.jpg "Down a rabbit hole")

So I wanted to start blogging but, [as many](https://512kb.club/), none of the common ways satisfied me.  
I could have gone to something like Medium, but then people might have to pay to read me, and I would have lost ownership of my blog.
Then there is stuff like wordpress but I find that running a backend application and a database for a blog is really overkill.  
What about Hugo and Jekyll then? That's way better, but still there are a few things that push me away.  

First, the setup is non-trivial as you'll need to run some specific command lines, update a configuration file and probably learn about the directory structure.  
Then you'll need to add non-standard metadata in your markdown file, sometimes even the filename needs to follow a specific format. 
Lastly the generated HTML will be ad-hoc with many divs and css classes.  

That's unfortunate because when you read the list of ~100 official HTML elements, it's pretty clear that you've all you need to make a blog. And Markdown translates very well to those elements. No need for complex div structures. Also, if you have your blog content versionned in something like git, information like the author's name and publication date are easy to find, no need to specify that in the header of your file.  
Could there be a better way?

## Enter GitBlog2

So I've made a python library that does just that, and a little bit more. Like Hugo and Jekyll it generates your usuall static assets (HTML, CSS and multimedia content), but unlike Hugo and Jekyll you just write your usuall markdown and pass the repository url to the cli. And it figures the rest out. The directories you place your files in become your blog sections. If you happen to host your repo on Github it can also figure-out your social accounts, profile picture and bio from your public profile.
Also there is a template that you can copy-paste in your Actions so that your blog is automatically published on cloudflare pages when you push a new commit, and don't even need to run the cli manually or write a config file.  

But not everything is rainbows and butterflies, there's a few thing that are not standardised, and for that I had to make ad-hoc choices.

* Your unbublished content must be in `draft/`
* Your post's description, *aka* summary must be a citation that just follows the title
* Your images, videos, audio, etc. goes in `media/`

And that's it, now you can have a blog for free while only focusing on writing its actual content.  
Feel free to use it for yourself, feedback is welcome!
