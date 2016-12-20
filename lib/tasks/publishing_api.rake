require 'logger'
require 'gds_api/publishing_api'
require 'gds_api/publishing_api/special_route_publisher'

class PublishSpecialRoutesHelper
  def publish_special_route(special_route)
    special_route_publisher.publish(
      {
        type: 'prefix',
        publishing_app: publishing_app,
        rendering_app: 'designprinciples'
      }.merge(special_route)
    )
  end

  def publish_redirect(redirect)
    (content_id, base_path, type, destination_path) = redirect
    logger.info("Registering redirect of '#{base_path}' -> '#{destination_path}'")

    redirect = {
      "content_id" => content_id,
      "base_path" => base_path,
      "format" => "redirect",
      "publishing_app" => publishing_app,
      "update_type" => "major",
      "redirects" => [
        {
          "path" => base_path,
          "type" => type,
          "destination" => destination_path
        }
      ]
    }

    publishing_api.put_content(content_id, redirect)
    publishing_api.publish(content_id, "major")
  end

private
  def publishing_app
    'design-principles'
  end

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  def special_route_publisher
    GdsApi::PublishingApi::SpecialRoutePublisher.new(
      logger: logger,
      publishing_api: publishing_api
    )
  end

  def publishing_api
    GdsApi::PublishingApiV2.new(
      Plek.new.find('publishing-api'),
      bearer_token: ENV['PUBLISHING_API_BEARER_TOKEN'] || 'example'
    )
  end
end

namespace :publishing_api do
  desc 'Publish special routes via publishing api'
  task :publish_special_routes do
    helper = PublishSpecialRoutesHelper.new

    [
      {
        title: 'GDS Design Principles',
        description: '',
        content_id: '8b7b20d4-4144-4f52-922a-2fec92e1a346',
        base_path: '/design-principles',
      },
      {
        title: 'Transformation programme',
        description: '',
        content_id: '00573998-7254-407c-ba28-776dd222cda3',
        base_path: '/transformation',
      }
    ].each(&helper.method(:publish_special_route))

    [
      # Redirections because the slugs changed.
      %w(b9b74acd-58bd-4e6b-8318-e6926a25c84d /designprinciples prefix /design-principles),
      %w(d0e21ccf-530c-4326-93a7-5badfa087754 /designprinciples/styleguide prefix /design-principles/style-guide),
      %w(f17a55b1-cffd-4e4f-b6e3-47ec5e2e8fd0 /design-principles/style-guide/policy-advisory-groups prefix /design-principles/style-guide/groups),
    ].each(&helper.method(:publish_redirect))
  end
end
