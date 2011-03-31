# SHAHeader

SHAHeader is a simple Rack middleware gem for Rails 3.  When required, it
will instruct Rails to automatically insert its middleware into the Rack
stack and inject your current git SHA hash into all of your dynamic
response headers.

## Compatibility

The SHAHeader gem is both Ruby 1.8.7 and 1.9.2 compatible.  Currently,
it is compatible with Rails 3.0.X.

## Installation

In Rails 3, modify your `Gemfile` to add the following line:

    gem 'sha_header'

That's it.  It is distributed with a `Railtie` to instruct Rails on how
to set it up, so no other coding is required.

## Example

Here's a simple example for a Rails application running locally.  The
application has added the above `Gemfile` line.  Using curl:

    curl -I http://localhost:3000/

And, the following response is received:

    HTTP/1.1 200 OK 
    Content-Type: text/html; charset=utf-8
    Etag: "25ec427afba8daa376f309559b1b3c5c"
    Cache-Control: max-age=0, private, must-revalidate
    X-Git-Sha: 8c139c519c731be597d0c37a6e5ce46a27bab174
    X-Ua-Compatible: IE=Edge
    X-Runtime: 0.120340
    Content-Length: 0
    Server: WEBrick/1.3.1 (Ruby/1.9.2/2011-02-18)
    Date: Thu, 31 Mar 2011 17:34:17 GMT
    Connection: Keep-Alive
