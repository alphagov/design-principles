namespace :router do
  task :router_environment do
    require 'router'
    require 'logger'
    @logger = Logger.new STDOUT
    @logger.level = Logger::DEBUG
 
    @router = Router.new "http://router.cluster:8080/router", @logger
    @app_id = 'designprinciples'
  end
 
  task :register_application => :router_environment do
    platform = ENV['FACTER_govuk_platform']
    url = "#{@app_id}.#{platform}.alphagov.co.uk"
    @logger.info "Registering #{@app_id} application against #{url}..."
    @router.update_application @app_id, url
  end
 
  task :register_routes => [ :router_environment ] do
    [
      'designprinciples',
      'designprinciples/styleguide',
      'designprinciples/performanceframework',
    ].each do |url|
      begin
        @logger.info "Registering full route #{url}"
        @router.create_route url, :full, @app_id
      rescue => e
        @logger.error "Error registering route: #{e.message}"
        raise
      end
    end
  end
 
  desc "Register design principles application and routes with the router (run this task on server in cluster)"
  task :register => [ :register_application, :register_routes ]
end
