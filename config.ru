# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack/rewrite'

use Rack::Rewrite do
  r301 '/service-manual/making-software/open-source.html', '/service-manual/making-software/choosing-technology'
  r301 '/service-manual/making-software/open-source', '/service-manual/making-software/choosing-technology'
end

run DesignPrinciples::Application
