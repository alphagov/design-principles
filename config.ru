require "rubygems"
require 'rack'
require 'rack/contrib/try_static'
require "bundler/setup"
require 'slimmer'


use Slimmer::App, asset_host: "https://static.preview.alphagov.co.uk/"
use Rack::TryStatic, root: "_site/", urls: %w[/], :try => ['.html', 'index.html', '/index.html']

# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/plain'}, ['whoops! Not Found']] }
