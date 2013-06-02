# phantomvis

Create beautiful [RadioVIS][radiodns] slides by harnessing the power of HTML, CSS, and responsive design.

[![Build Status](https://travis-ci.org/samstarling/phantomvis.png?branch=master)](https://travis-ci.org/samstarling/phantomvis) [![Code Climate](https://codeclimate.com/github/samstarling/phantomvis.png)](https://codeclimate.com/github/samstarling/phantomvis)

## Installation

Install the Ruby dependencies, using `bundler`:

    $ gem install bundler
    $ bundle install

You'll also need to [install PhantomJS][phantom]. On a Mac with Homebrew, you can just:

    $ brew install phantomjs

## Purpose

RadioVIS is a great technology, but it's difficult to create dynamic images that look nice – and our radios deserve nice shiny images. We shouldn't have to mess around with image libraries like GD and PIL to make slides for RadioVIS. Why not use something we're a bit more used to, and that's more designer-friendly?

It's pretty easy to create a good looking webpage. And we can use nice things like CSS3 to do rounded corners, drop shadows, 3D transforms... all sorts. And if we use HAML, we can even have template inheritance and stop repeating ourselves. Lovely.

And for bonus points, we can use these same technologies to create slides in multiple sizes through the use of responsive design.

It's important to note that these applications don't have anything to do with the actual sending of RadioVIS messages to a message broker for delivery to clients. This is just a framework for generating RadioVIS content.

### Example Image

[Examples can be found on the wiki.][examples]

### Still To Do

* Split example server out into separate app
* Component to watch for 'expired' images
  * Then publish to a topic
  * Alternatively, watch a directory?
* Capturer needs to listen to this topic
  * Then publish to uploader topic
* Uploader then listens to this topic
  * Uploads, and publishes to 'finished' topic
  * Then people can decide what to do with that...

[radiodns]: http://radiodns.org/documentation/
[examples]: https://github.com/samstarling/phantomvis/wiki/Slide-Examples
[phantom-dl]: http://phantomjs.org/download.html
[phantom]: http://phantomjs.org/
