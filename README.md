What this is:
=============

It analyzes an html page, looks for images, then substitutes them with divs that
render the appropriate portion of a sprite that contains the original images.

The purpose is to have only one request per page for all the images on that
page.

How do I hope to achieve this:
==============================

* Page is generated by whatever backend there is and sent back to apache as a
  response.
* Before Apache passes on the response to the client, a filter intercepts the
  response and does some analysis and transformations on the HTML source:

  * Replace all `<img>` tags with `<div>` tags with a uniquely named class attached
    to it.
  * Construct a mapping from the class of each `<div>` that replaced an `<img>` tag 
    to the original URL of respective image.
  * Generate CSS to populate `<div>` tags with original images cut out from a
    generated sprite. The generated sprite is assumed to be a column stacking of
    all the original images.
  * A request to any image is mapped by Apache to a controller that serves the
    generated sprite from the original image URLs.

* Browser ends up sending only one request for all the images.
* Images end up being rendered just as if they have been if they were still in
  image tags.
