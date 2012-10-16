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
to serve up slides - as the `capturer` just points at URLs.

#### capturer

Captures slides as images of various sizes, and saves them to disk.

#### uploader

Uploads images in a variety of ways. (Not here yet!)

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
