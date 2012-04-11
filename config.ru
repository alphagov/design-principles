require "rubygems"
require 'rack'
require 'rack/contrib/try_static'
require "bundler/setup"
require 'slimmer'

use Slimmer::App, asset_host: "https://static.preview.alphagov.co.uk/"

map "/designprinciples" do
  run Rack::File.new("_site/index.html")
end


map "/designprinciples/styleguide" do
  run Rack::File.new("_site/styleguide.html")
end

map "/designprinciples/digital" do
  run Rack::File.new("_site/digital.html")
end

#use Rack::TryStatic, root: "_site/", urls: %w[/], :try => ['.html', 'index.html', '/index.html']
# otherwise 404 NotFound
#run lambda { [404, {'Content-Type' => 'text/plain'}, ['whoops! Not Found']] }
