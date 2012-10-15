# phantomvis

Create beautiful RadioVIS slides that harness CSS3.

## Introduction

RadioVIS is a great technology, but it's difficult to create dynamic images
that look really nice. And our radios deserve nice shiny images. We shouldn't
have to mess around with image libraries like GD and PIL to make slides for
RadioVIS. Why not use something we're a bit more used to?

It's pretty easy to create a good looking webpage. And we can use nice things
like CSS3 to do rounded corners, drop shadows, 3D transforms... all sorts.
And if we use HAML, we can even have template inheritance and stop repeating
ourselves. Lovely.

And for bonus points, we can create slides in multiple sizes by using
responsive design.

### Components

* *server* - Serves slides as HTML
* *capturer* - Captures slides as images
* *uploader* - Uploads images

## Requirements

    $ brew install phantomjs
