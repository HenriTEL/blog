# Icons the modern way

Wrap each icon in `<symbol id="whatever"...>` and use them with `<svg> <use xlink:href="/your/icons.svg#whatever">...`.  

The benefits are:
* Keeps things clean as we refer svg icons instead of including them raw.
* Scales with the font (set height and width to 1em).
* Free of accessibility issues that may arise from the use of custom fonts.
* Fast and efficient as we can put just the necessary icons in one file that will be served and cached in one request.
* Flexible because you can choose icons from a variety of existing sets.
