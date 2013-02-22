#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'optparse'

class HttpStatus
  def initialize
    @statuses = {
      '100' => 'Continue',
      '101' => 'Switching Protocols',
      '102' => 'Processing',                      # RFC '251'8 (WebDAV)
      '200' => 'OK',
      '201' => 'Created',
      '202' => 'Accepted',
      '203' => 'Non-Authoritative Information',
      '204' => 'No Content',
      '205' => 'Reset Content',
      '206' => 'Partial Content',
      '207' => 'Multi-Status',                 # RFC '251'8 (WebDAV)
      '208' => 'Already Reported',             # RFC '584'2
      '300' => 'Multiple Choices',
      '301' => 'Moved Permanently',
      '302' => 'Found',
      '303' => 'See Other',
      '304' => 'Not Modified',
      '305' => 'Use Proxy',
      '307' => 'Temporary Redirect',
      '400' => 'Bad Request',
      '401' => 'Unauthorized',
      '402' => 'Payment Required',
      '403' => 'Forbidden',
      '404' => 'Not Found',
      '405' => 'Method Not Allowed',
      '406' => 'Not Acceptable',
      '407' => 'Proxy Authentication Required',
      '408' => 'Request Timeout',
      '409' => 'Conflict',
      '410' => 'Gone',
      '411' => 'Length Required',
      '412' => 'Precondition Failed',
      '413' => 'Request Entity Too Large',
      '414' => 'Request-URI Too Large',
      '415' => 'Unsupported Media Type',
      '416' => 'Request Range Not Satisfiable',
      '417' => 'Expectation Failed',
      '418' => 'I\'m a teapot',            # RFC '232'4
      '422' => 'Unprocessable Entity',     # RFC '251'8 (WebDAV)
      '423' => 'Locked',                   # RFC '251'8 (WebDAV)
      '424' => 'Failed Dependency',        # RFC '251'8 (WebDAV)
      '425' => 'No code',                  # WebDAV Advanced Collections
      '426' => 'Upgrade Required',         # RFC '281'7
      '428' => 'Precondition Required',
      '429' => 'Too Many Requests',
      '431' => 'Request Header Fields Too Large',
      '449' => 'Retry with',                      # unofficial Microsoft
      '500' => 'Internal Server Error',
      '501' => 'Not Implemented',
      '502' => 'Bad Gateway',
      '503' => 'Service Unavailable',
      '504' => 'Gateway Timeout',
      '505' => 'HTTP Version Not Supported',
      '506' => 'Variant Also Negotiates',         # RFC '229'5
      '507' => 'Insufficient Storage',            # RFC '251'8 (WebDAV)
      '509' => 'Bandwidth Limit Exceeded',        # unofficial
      '510' => 'Not Extended',                    # RFC '277'4
      '511' => 'Network Authentication Required'
    }
  end

  def usage
  usage_text = <<-"USAGE"
httpstatus shows meaning of HTTP status code.
Usage:
  httpstatus [statuscode_or_keyword] 

Options:
  -v, [--version] show version
  -h, [--help]    show usage
USAGE
  end

  def parse_opts(argv)
    OptionParser.new { |opt|
      opt.on("-v", "--version") {
        version = File.read File.join(File.dirname(__FILE__), "../VERSION")
        puts "httpstatus #{version}"
        exit(0)
      }
      opt.on("-h", "--help") {
        puts usage
        exit(0)
      }
      
      opt.parse! argv
    }
  end

  def lookup(code)
    results = []
    @statuses.each do |c, m|
      if !code || c.start_with?(code) || m.downcase.match(code.downcase)
        results << "#{c}: #{m}"
      end
    end
    results
  end

  def run(args)
    parse_opts(args)
    code = args.shift
    results = lookup code
    puts results
  end
end