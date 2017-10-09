require 'logger'
require 'gds_api/publishing_api'
require 'gds_api/publishing_api/special_route_publisher'

class PublishSpecialRoutesHelper
  def publish_special_route(special_route)
    reserve_path(special_route[:base_path])

    special_route_publisher.publish(
      {
        type: "exact",
        description: "",
        publishing_app: publishing_app,
        rendering_app: publishing_app
      }.merge(special_route)
    )
  end

  def publish_redirect(redirect)
    (content_id, base_path, type, destination_path) = redirect
    logger.info("Registering redirect of '#{base_path}' -> '#{destination_path}'")
    reserve_path(base_path)

    redirect = {
      "content_id" => content_id,
      "base_path" => base_path,
      "schema_name" => "redirect",
      "document_type" => "redirect",
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

  def reserve_path(path)
    publishing_api_v1.put_path(
      path,
      publishing_app: publishing_app,
      override_existing: true
    )
  end

private
  def publishing_app
    'service-manual-frontend'
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

  def publishing_api_v1
    GdsApi::PublishingApi.new(
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
        title: "GDS Design Principles",
        content_id: "aa5431bb-2f2e-4e6a-a819-d25c5ba6b5d0",
        base_path: "/design-principles/accessiblepdfs",
      },
      {
        title: "GDS Design Principles",
        content_id: "74a68f1b-d86d-42e4-b79d-05ff5b932265",
        base_path: "/design-principles/performanceframework",
      },
      {
        title: "GDS Design Principles",
        content_id: "7672ae7d-6efb-4816-bd74-c49a6cb43f04",
        base_path: "/design-principles/style-guide.atom",
      },
      {
        title: 'Transformation programme',
        content_id: '00573998-7254-407c-ba28-776dd222cda3',
        base_path: '/transformation',
        type: "prefix",
      }
    ].each(&helper.method(:publish_special_route))

    [
      %w(8b7b20d4-4144-4f52-922a-2fec92e1a346 /design-principles exact /guidance/government-design-principles),

      %w(52028eb3-c0ef-412d-a986-2fc0a342569e /design-principles/mainstream exact /design-principles/style-guide),
      %w(a82e1adb-637d-4cfe-986b-b65dd7fe4f48 /design-principles/insidegovernment exact /design-principles/style-guide/writing-for-govuk),
      %w(93554c24-c13c-49ed-b5de-759a4cb0a7b8 /design-principles/detailedguides exact /design-principles/style-guide/detailed-guides),
      %w(185e6998-106e-494f-87fd-46d095ec32dc /design-principles/whatsnew exact /design-principles/style-guide/whats-new),
      %w(ce017d8c-7d39-4a8c-aed9-af236edd656a /design-principles/seo exact /design-principles/style-guide/writing-for-govuk#seo),

      %w(b9b74acd-58bd-4e6b-8318-e6926a25c84d /designprinciples prefix /design-principles),
      %w(d0e21ccf-530c-4326-93a7-5badfa087754 /designprinciples/styleguide prefix /topic/government-digital-guidance/content-publishing),
      %w(f17a55b1-cffd-4e4f-b6e3-47ec5e2e8fd0 /design-principles/style-guide/policy-advisory-groups prefix /design-principles/style-guide/groups),
    ].each(&helper.method(:publish_redirect))
  end
end
