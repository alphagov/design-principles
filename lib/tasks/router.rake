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
      ["/service-manual/digital-by-default/assessments-before-2014", "exact", "/service-manual/digital-by-default/"],
      ["/service-manual/digital-by-default/assessments-before-2014.html", "exact", "/service-manual/digital-by-default/"],
      ["/service-manual/digital-by-default/go-live-panel", "exact", "/service-manual/digital-by-default/"],
      ["/service-manual/digital-by-default/go-live-panel.html", "exact", "/service-manual/digital-by-default/"],
      ["/service-manual/identity-assurance/guidance-for-government-service-providers", "exact", "/service-manual/identity-assurance"],
      ["/service-manual/identity-assurance/guidance-for-government-service-providers.html", "exact", "/service-manual/identity-assurance"],
      ["/service-manual/user-centered-design", "prefix", "/service-manual/user-centred-design"],
      ["/service-manual/user-centered-design/accessibility", "prefix", "/service-manual/user-centred-design/accessibility"],
      ["/service-manual/user-centered-design/browsers-and-devices", "prefix", "/service-manual/user-centred-design/browsers-and-devices"],
      ["/service-manual/user-centered-design/card-sorting", "prefix", "/service-manual/user-centred-design/card-sorting"],
      ["/service-manual/user-centered-design/choosing-appropriate-formats", "prefix", "/service-manual/user-centred-design/choosing-appropriate-formats"],
      ["/service-manual/user-centered-design/data-visualisation", "prefix", "/service-manual/user-centred-design/data-visualisation"],
      ["/service-manual/user-centered-design/designing-transactions", "prefix", "/service-manual/user-centred-design/designing-transactions"],
      ["/service-manual/user-centered-design/how-users-read", "prefix", "/service-manual/user-centred-design/how-users-read"],
      ["/service-manual/user-centered-design/introduction-to-user-research", "prefix", "/service-manual/user-centred-design/introduction-to-user-research"],
      ["/service-manual/user-centered-design/know-your-users", "prefix", "/service-manual/user-centred-design/know-your-users"],
      ["/service-manual/user-centered-design/print-forms", "prefix", "/service-manual/user-centred-design/print-forms"],
      ["/service-manual/user-centered-design/resources/buttons", "prefix", "/service-manual/user-centred-design/resources/buttons"],
      ["/service-manual/user-centered-design/resources/captcha", "prefix", "/service-manual/user-centred-design/resources/captcha"],
      ["/service-manual/user-centered-design/resources/colour-palettes", "prefix", "/service-manual/user-centred-design/resources/colour-palettes"],
      ["/service-manual/user-centered-design/resources/creating-accessible-PDFs", "prefix", "/service-manual/user-centred-design/resources/creating-accessible-PDFs"],
      ["/service-manual/user-centered-design/resources/forms", "prefix", "/service-manual/user-centred-design/resources/forms"],
      ["/service-manual/user-centered-design/resources/grids", "prefix", "/service-manual/user-centred-design/resources/grids"],
      ["/service-manual/user-centered-design/resources/header-footer", "prefix", "/service-manual/user-centred-design/resources/header-footer"],
      ["/service-manual/user-centered-design/resources/registration-form", "prefix", "/service-manual/user-centred-design/resources/registration-form"],
      ["/service-manual/user-centered-design/resources/sass-repositories", "prefix", "/service-manual/user-centred-design/resources/sass-repositories"],
      ["/service-manual/user-centered-design/resources/shared-asset-libraries", "prefix", "/service-manual/user-centred-design/resources/shared-asset-libraries"],
      ["/service-manual/user-centered-design/resources/typography", "prefix", "/service-manual/user-centred-design/resources/typography"],
      ["/service-manual/user-centered-design/resources/writing-for-transactions", "prefix", "/service-manual/user-centred-design/resources/writing-for-transactions"],
      ["/service-manual/user-centered-design/service-look-and-feel", "prefix", "/service-manual/user-centred-design/service-look-and-feel"],
      ["/service-manual/user-centered-design/user-centred-design-alpha-beta", "prefix", "/service-manual/user-centred-design/user-centred-design-alpha-beta"],
      ["/service-manual/user-centered-design/user-needs", "prefix", "/service-manual/user-centred-design/user-needs"],
      ["/service-manual/user-centered-design/user-research", "prefix", "/service-manual/user-centred-design/user-research/index"],
      ["/service-manual/user-centered-design/user-research/community-user-groups", "prefix", "/service-manual/user-centred-design/user-research/community-user-groups"],
      ["/service-manual/user-centered-design/user-research/discussion-guides", "prefix", "/service-manual/user-centred-design/user-research/discussion-guides"],
      ["/service-manual/user-centered-design/user-research/ethnographic-research", "prefix", "/service-manual/user-centred-design/user-research/ethnographic-research"],
      ["/service-manual/user-centered-design/user-research/expert-review", "prefix", "/service-manual/user-centred-design/user-research/expert-review"],
      ["/service-manual/user-centered-design/user-research/focus-groups-mini-groups-interviews", "prefix", "/service-manual/user-centred-design/user-research/focus-groups-mini-groups-interviews"],
      ["/service-manual/user-centered-design/user-research/guerilla-testing", "prefix", "/service-manual/user-centered-design/user-research/guerrilla-testing"],
      ["/service-manual/user-centered-design/user-research/guerrilla-testing", "prefix", "/service-manual/user-centred-design/user-research/guerrilla-testing"],
      ["/service-manual/user-centered-design/user-research/lab-based-user-testing", "prefix", "/service-manual/user-centred-design/user-research/lab-based-user-testing"],
      ["/service-manual/user-centered-design/user-research/multivariate-testing", "prefix", "/service-manual/user-centred-design/user-research/multivariate-testing"],
      ["/service-manual/user-centered-design/user-research/online-omnibus-survey", "prefix", "/service-manual/user-centred-design/user-research/online-omnibus-survey"],
      ["/service-manual/user-centered-design/user-research/online-research-panels", "prefix", "/service-manual/user-centred-design/user-research/online-research-panels"],
      ["/service-manual/user-centered-design/user-research/remote-usability", "prefix", "/service-manual/user-centred-design/user-research/remote-usability"],
      ["/service-manual/user-centered-design/user-research/same-day-user-testing", "prefix", "/service-manual/user-centred-design/user-research/same-day-user-testing"],
      ["/service-manual/user-centered-design/user-research/sampling-methodologies", "prefix", "/service-manual/user-centred-design/user-research/sampling-methodologies"],
      ["/service-manual/user-centered-design/user-research/sentiment-analysis", "prefix", "/service-manual/user-centred-design/user-research/sentiment-analysis"],
      ["/service-manual/user-centered-design/user-research/survey-design", "prefix", "/service-manual/user-centred-design/user-research/survey-design"],
      ["/service-manual/user-centered-design/user-research/user-research-briefs", "prefix", "/service-manual/user-centred-design/user-research/user-research-briefs"],
      ["/service-manual/user-centered-design/user-research/user-research-surveys", "prefix", "/service-manual/user-centred-design/user-research/user-research-surveys"],
      ["/service-manual/user-centered-design/user-research/user-research-tools", "prefix", "/service-manual/user-centred-design/user-research/user-research-tools"],
      ["/service-manual/user-centered-design/what-should-service-look-like", "exact", "/service-manual/user-centered-design/service-look-and-feel"],
      ["/service-manual/user-centered-design/what-should-service-look-like.html", "exact", "/service-manual/user-centered-design/service-look-and-feel"],
      ["/service-manual/user-centered-design/working-with-prototypes", "prefix", "/service-manual/user-centred-design/working-with-prototypes"],
      ["/service-manual/user-centered-design/writing-government-services", "exact", "/service-manual/content-designers/transactions-style-guide"],
      ["/service-manual/user-centered-design/writing-government-services.html", "exact", "/service-manual/content-designers/transactions-style-guide"],
      ["/transformation/property-register", "prefix", "/transformation/land-registry"],
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
