# phantomvis

Create beautiful RadioVIS slides by harnessing the power of HTML, CSS, and
responsive design.

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

#### server

Serves slides as HTML. Based on the popular Sinatra framework. In
this project, it's really just an example. You could use whatever you like
to serve up slides, because the `capturer` just points at URLs.

The included server gives some very simple examples of how you might
consume APIs in order to provide dynamic data in your RadioVIS slides.

#### capturer

Captures the slide template you make, and uses PhantomJS to render them as 
images in the sizes that you specify. These images are then saved to disk.
Templates can be given a TTL, after which they are regenerated. This is
useful for dynamic slides – such as 'Now Playing'.

#### uploader

Uploads images to the internet, so that they can be seen by
listeners. *This component doesn't exist in this repository yet!*

## Example Image

![Example image](https://raw.github.com/samstarling/phantomvis/master/examples/home-300.png)

## Requirements

* [PhantomJS](http://phantomjs.org/)
* Ruby dependencies are in Gemfiles

## TODO

* Component to watch for 'expired' images
  * Then publish to a topic
  * Alternatively, watch a directory?
* Capturer needs to listen to this topic
  * Then publish to uploader topic
* Uploader then listens to this topic
  * Uploads, and publishes to 'finished' topic
  * Then people can decide what to do with that...
