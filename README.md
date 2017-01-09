[![Build Status](https://travis-ci.org/nbibler/sha_header.png?branch=master)](https://travis-ci.org/nbibler/sha_header)

:construction: This library has been replaced by [Rapporteur][]. :construction:

Rapporteur provides similar functionality, although rather than injecting the
revision information into every request as sha_header does, it provides a
status endpoint where you can provide multiple server data points (Git
revision, system time, uptime, whatever).

# SHAHeader

SHAHeader is a simple Rack middleware gem for Rails 3.  When required, it
will instruct Rails to automatically insert its middleware into the Rack
stack and inject your current git SHA hash into all of your dynamic
response headers.

## Compatibility

The SHAHeader gem is compatible with:

* Ruby 2.1 through 2.4, and
* Rails 3.2 through 5.0.

## Installation

In Rails, modify your `Gemfile` to add the following line:

    gem 'sha_header', '~> 1.0'

That's it.  It is distributed with a `Railtie` to instruct Rails on how
to set it up, so no other coding is required.

## Example

Here's a simple example for a Rails application running locally.  The
application has added the above `Gemfile` line.  Using curl:

    curl -I http://localhost:3000/

And, the following response is received:

    HTTP/1.1 200 OK 
    Content-Type: text/html; charset=utf-8
    ETag: "25ec427afba8daa376f309559b1b3c5c"
    Cache-Control: max-age=0, private, must-revalidate
    X-Git-SHA: 8c139c519c731be597d0c37a6e5ce46a27bab174
    X-UA-Compatible: IE=Edge
    X-Runtime: 0.120340
    Content-Length: 0
    Connection: Keep-Alive

(Notice the `X-Git-SHA` header)

[Rapporteur]: https://rubygems.org/gems/rapporteur
