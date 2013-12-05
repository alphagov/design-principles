namespace :router do
  task :router_environment do
    require 'logger'
    require 'plek'
    require 'gds_api/router'
    @logger = Logger.new STDOUT
    @logger.level = Logger::DEBUG

    @router_api = GdsApi::Router.new(Plek.current.find('router-api'))
    @app_id = 'designprinciples'
  end

  task :register_backend => :router_environment do
    url = Plek.current.find(@app_id, :force_http => true) + "/"
    @logger.info "Registering #{@app_id} application against #{url}"
    @router_api.add_backend(@app_id, url)
  end

  task :register_routes => [ :router_environment ] do
    [
      %w(/design-principles prefix),
      %w(/service-manual prefix),
      %w(/transformation prefix),
    ].each do |path, type|
      begin
        @logger.info "Registering #{type} route #{path}"
        @router_api.add_route(path, type, @app_id, :skip_commit => true)
      rescue => e
        @logger.error "Error registering route: #{e.message}"
        raise
      end
    end

    [
      # Redirections because the slugs changed.
      %w(/designprinciples prefix /design-principles),
      %w(/designprinciples/styleguide prefix /design-principles/style-guide),

      # Redirections for old content
      ["/service-manual/user-centered-design/writing-government-services", "exact", "/service-manual/content-designers/transactions-style-guide"],
      ["/service-manual/user-centered-design/writing-government-services.html", "exact", "/service-manual/content-designers/transactions-style-guide"],
    ].each do |path, type, destination|
      begin
        @logger.info "Registering #{type} redirect route from #{path} -> #{destination}"
        @router_api.add_redirect_route(path, type, destination, "permanent", :skip_commit => true)
      rescue => e
        @logger.error "Error registering route: #{e.message}"
        raise
      end
    end
    @router_api.commit_routes
  end

  desc "Register design principles application and routes with the router (run this task on server in cluster)"
  task :register => [ :register_backend, :register_routes ]
end
