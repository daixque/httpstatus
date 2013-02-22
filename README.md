httpstatus
============================

httpstatus shows meaning of given HTTP status code.

## Usage

exact match

    $ httpstatus 404
    404: Not Found

show status code starts with 40

    $ httpstatus 40
    400: Bad Request
    401: Unauthorized
    402: Payment Required
    403: Forbidden
    404: Not Found
    405: Method Not Allowed
    406: Not Acceptable
    407: Proxy Authentication Required
    408: Request Timeout
    409: Conflict

find by meaning

    $ httpstatus request
    400: Bad Request
    408: Request Timeout
    413: Request Entity Too Large
    414: Request-URI Too Large
    416: Request Range Not Satisfiable
    429: Too Many Requests
    431: Request Header Fields Too Large

show all statuses

    $ httpstatus
    100: Continue
    101: Switching Protocols
    102: Processing
    200: OK
    ...

## Install

    $ gem install httpstatus

## Contributing to httpstatus
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 daixque. See LICENSE.txt for
further details.

