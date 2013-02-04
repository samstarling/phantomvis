# phantomvis

Create beautiful [RadioVIS][1] slides by harnessing the power of HTML, CSS, and
responsive design.

[![Build Status](https://travis-ci.org/samstarling/phantomvis.png?branch=master)](https://travis-ci.org/samstarling/phantomvis)  
[![Code Climate](https://codeclimate.com/github/samstarling/phantomvis.png)](https://codeclimate.com/github/samstarling/phantomvis)

## Installation

Install the Ruby dependencies, using `bundler`:

    $ gem install bundler
    $ bundle install

You'll also need to [install PhantomJS](http://phantomjs.org/download.html).

## Introduction

RadioVIS is a great technology, but it's difficult to create dynamic images that look nice – and our radios deserve nice shiny images. We shouldn't have to mess around with image libraries like GD and PIL to make slides for RadioVIS. Why not use something we're a bit more used to, and that's more designer-friendly?

It's pretty easy to create a good looking webpage. And we can use nice things like CSS3 to do rounded corners, drop shadows, 3D transforms... all sorts. And if we use HAML, we can even have template inheritance and stop repeating ourselves. Lovely.

And for bonus points, we can use these same technologies to create slides in multiple sizes through the use of responsive design.

It's important to note that these applications don't have anything to do with the actual sending of RadioVIS messages to a message broker for delivery to clients. This is just a framework for generating content.

### Components

#### server

Serves slides as HTML. Based on the popular Sinatra framework. In this project, it's really just an example. You could use whatever you like to serve up slides, because the `capturer` just points at URLs.

The included server gives some very simple examples of how you might
consume APIs in order to provide dynamic data in your RadioVIS slides.

#### capturer

Captures the slide template you make, and uses PhantomJS to render them as 
images in the sizes that you specify. These images are then saved to disk.
Templates can be given a TTL, after which they are regenerated. This is
useful for dynamic slides – such as 'Now Playing'.

#### uploader

Uploads images to the internet, so that they can be seen by
listeners. It also tidies up after itself, by deleting the original image
once it's been uploaded. It also has the

*Note: This component doesn't exist yet, but it'll be along soon.*

## Example Image

[Examples can be found on the wiki.](https://github.com/samstarling/phantomvis/wiki/Slide-Examples)

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

[1]: http://radiodns.org/documentation/
