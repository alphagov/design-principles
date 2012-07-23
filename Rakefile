# Originally adopted from Raimonds Simanovskis Rakefile, 
#   http://github.com/rsim/blog.rayapps.com/blob/master/Rakefile
#   which was in turn adopted from Tate Johnson's Rakefile
#   http://github.com/tatey/tatey.com/blob/master/Rakefile


require 'webrick'
require 'directory_watcher'
require "term/ansicolor"
require "jekyll"
require "yaml"
include Term::ANSIColor
include WEBrick

task :default => :develop

desc 'Build site with Jekyll.'
task :build do
  printHeader "Compiling website..."
  options = Jekyll.configuration({})
  @site = Jekyll::Site.new(options)
  @site.process
end

def globs(source)
  Dir.chdir(source) do
    dirs = Dir['*'].select { |x| File.directory?(x) }
    dirs -= ['_site']
    dirs = dirs.map { |x| "#{x}/**/*" }
    dirs += ['*']
  end
end

desc 'Enter development mode.'
task :develop => :build do
  printHeader "Auto-regenerating enabled."
  directoryWatcher = DirectoryWatcher.new("./")
  directoryWatcher.interval = 1
  directoryWatcher.glob = globs(Dir.pwd)
  directoryWatcher.add_observer do |*args| @site.process end
  directoryWatcher.start
  mimeTypes = WEBrick::HTTPUtils::DefaultMimeTypes
  mimeTypes.store 'js', 'application/javascript'
  server = HTTPServer.new(
    :BindAddress  => "localhost",
    :Port     => 4000,
    :DocumentRoot => "_site",
    :MimeTypes    => mimeTypes,
    :Logger     => Log.new($stderr, Log::ERROR),
    :AccessLog    => [["/dev/null", AccessLog::COMBINED_LOG_FORMAT ]]
  )
  thread = Thread.new { server.start }
  trap("INT") { server.shutdown }
  printHeader "Development server started at http://localhost:4000/"
  printHeader "Opening website in default web browser..."
  %x[open http://localhost:4000/]
  printHeader "Development mode entered."
  thread.join()
end

desc 'Remove all built files.'
task :clean do
  printHeader "Cleaning build directory..."
  %x[rm -rf _site]
end

def ask message
  print message
  STDIN.gets.chomp
end

def printHeader headerText
  print bold + blue + "==> " + reset
  print bold + headerText + reset + "\n"
end


namespace :router do
  task :router_environment do
    Bundler.require :router, :default

    require 'logger'
    @logger = Logger.new STDOUT
    @logger.level = Logger::DEBUG

    @router = Router::Client.new :logger => @logger
  end

  task :register_application => :router_environment do
    platform = ENV['FACTER_govuk_platform']
    app_id = "designprinciples"
    url = "#{app_id}.#{platform}.alphagov.co.uk/"
    @logger.info "Registering #{app_id} application against #{url}..."
    @router.applications.update application_id: app_id, backend_url: url
  end

  task :register_routes => [ :router_environment ] do
    app_id = "designprinciples"
    begin
      @logger.info "Registering full route /designprinciples"
      @router.routes.update application_id: app_id, route_type: :full,
        incoming_path: "/designprinciples"
    rescue Router::Conflict => conflict_error
      @logger.error "Route already exists: #{conflict_error.existing}"
      raise conflict_error
    end
    begin
      @logger.info "Registering full route /designprinciples/styleguide"
      @router.routes.update application_id: app_id, route_type: :full,
        incoming_path: "/designprinciples/styleguide"
    rescue Router::Conflict => conflict_error
      @logger.error "Route already exists: #{conflict_error.existing}"
      raise conflict_error
    end
    begin
      @logger.info "Registering full route /designprinciples/performanceframework"
      @router.routes.update application_id: app_id, route_type: :full,
        incoming_path: "/designprinciples/performanceframework"
    rescue Router::Conflict => conflict_error
      @logger.error "Route already exists: #{conflict_error.existing}"
      raise conflict_error
    end
    begin
      @logger.info "Registering temporary path for designprinciples assets"
      @router.routes.update application_id: app_id, route_type: :prefix,
        incoming_path: "/app"
    rescue Router::Conflict => conflict_error
      @logger.error "Route already exists: #{conflict_error.existing}"
      raise conflict_error
    end

  end

  desc "Register design principles application and routes with the router (run this task on server in cluster)"
  task :register => [ :register_application, :register_routes ]
end
