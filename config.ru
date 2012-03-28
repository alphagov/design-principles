require 'slimmer'

use Slimmer::App, asset_host: "https://static.preview.alphagov.co.uk/"
use ::Rack::Static, root: "_site/", urls: %w[/]

# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/plain'}, ['whoops! Not Found']] }
