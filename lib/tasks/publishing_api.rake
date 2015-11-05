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

    publishing_api.put_content_item(base_path, redirect)
  end

private
  def publishing_app
    'design-principles'
  end

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  def special_route_publisher
    GdsApi::PublishingApi::SpecialRoutePublisher.new(logger: logger)
  end

  def publishing_api
    GdsApi::PublishingApi.new(Plek.find("publishing-api"))
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
        title: 'GDS Service Manual',
        description: '',
        content_id: '51dd8775-cd2a-4fb3-b6df-8ed03591122d',
        base_path: '/service-manual',
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

      # Missed redirections from service manual (post-beta only)
      %w(2982e8b3-c617-4196-9e66-24eead050065 /service-manual/browsers-and-devices exact /service-manual/user-centred-design/browsers-and-devices),
      %w(81e0d5ab-1c75-4976-ae0f-4c30ec84f48b /service-manual/browsers-and-devices/index exact /service-manual/user-centred-design/browsers-and-devices),
      %w(f509c115-f8db-4d25-926c-d1f0db580b3a /service-manual/browsers-and-devices/index.html exact /service-manual/user-centred-design/browsers-and-devices),
      %w(f02d3049-e4bd-435a-86c1-48226681be2d /service-manual/content-and-design/browsers-and-devices exact /service-manual/user-centred-design/browsers-and-devices),
      %w(5c5cf0ca-689d-487f-8664-b833ad6054bf /service-manual/content-and-design/browsers-and-devices.html exact /service-manual/user-centred-design/browsers-and-devices),
      %w(3b40263c-dff7-429c-8bbc-f14e089713de /service-manual/design-and-content/browsers-and-devices exact /service-manual/user-centred-design/browsers-and-devices),
      %w(5855f047-a896-4293-975c-d2f1ab87f78d /service-manual/design-and-content/browsers-and-devices.html exact /service-manual/user-centred-design/browsers-and-devices),

      # Redirections for old content
      %w(9e0f472a-e841-46f8-acda-e79dab31dcde /service-manual/digital-by-default/assessments-before-2014 exact /service-manual/digital-by-default),
      %w(7e938e62-77da-4006-a4da-da5e0e0011ff /service-manual/digital-by-default/assessments-before-2014.html exact /service-manual/digital-by-default),
      %w(20d2a78c-3381-403b-90b4-fd008a8bfef5 /service-manual/digital-by-default/go-live-panel exact /service-manual/digital-by-default),
      %w(07874e97-c8b8-4001-8fc6-5859cfe7e2e3 /service-manual/digital-by-default/go-live-panel.html exact /service-manual/digital-by-default),
      %w(b5ace0c3-2464-45f5-9899-aa9a796a57ee /service-manual/identity-assurance/guidance-for-government-service-providers exact /service-manual/identity-assurance),
      %w(cea11156-3410-4db2-8841-3bc0dbc950e6 /service-manual/identity-assurance/guidance-for-government-service-providers.html exact /service-manual/identity-assurance),
      %w(a1ca5257-b11c-45cd-aab2-6577e747f5cb /service-manual/making-software/accessibility-testing exact /service-manual/user-centred-design/user-research/accessibility-testing),
      %w(fb654699-432a-4c1a-9bb2-5eba3603c83f /service-manual/making-software/accessibility-testing.html exact /service-manual/user-centred-design/user-research/accessibility-testing),
      %w(d7a45516-7d97-4027-9f10-80b45f610fc1 /service-manual/the-team/induction-and-development exact /service-manual/the-team/learning-and-development),
      %w(bcb3d093-b474-4aa6-9626-2cd1a722fbe6 /service-manual/the-team/induction-and-development.html exact /service-manual/the-team/learning-and-development),
      %w(f2bbd7a4-1997-4073-8008-10ee0b615a8e /service-manual/user-centered-design prefix /service-manual/user-centred-design),
      %w(33600e8e-c395-4fa2-819e-0f9925cdfa17 /service-manual/user-centred-design/service-look-and-feel exact /service-manual/user-centred-design/service-user-experience),
      %w(965d3fb2-b554-475c-bc23-d6f3ab693368 /service-manual/user-centred-design/service-look-and-feel.html exact /service-manual/user-centred-design/service-user-experience),
      %w(028aa47a-780d-41c2-b566-624cff73c549 /service-manual/user-centered-design/user-research/guerilla-testing prefix /service-manual/user-centred-design/user-research/guerrilla-testing),
      %w(3be33940-67d3-4a76-81de-8dd38d22574a /service-manual/user-centered-design/user-research/guerrilla-testing prefix /service-manual/user-centred-design/user-research/guerrilla-testing),
      %w(44ae665c-d098-4742-b0c2-771ef64773ce /service-manual/user-centered-design/what-should-service-look-like exact /service-manual/user-centred-design/service-user-experience),
      %w(053afa30-83b8-40fb-84dd-6cfdd90396f8 /service-manual/user-centered-design/what-should-service-look-like.html exact /service-manual/user-centred-design/service-user-experience),
      %w(48f71b1c-fed2-4fe4-8e02-c05c21426f9c /service-manual/user-centered-design/writing-government-services exact /service-manual/content-designers/transactions-style-guide),
      %w(b5ec4a08-f9ae-4ad5-84bf-cb4b88a20c5f /service-manual/user-centered-design/writing-government-services.html exact /service-manual/content-designers/transactions-style-guide),
      %w(11f41aa2-f712-4bb8-a38d-bf0e4109eb6d /service-manual/user-centred-design/know-your-users exact /service-manual/user-centred-design/user-needs),
      %w(141d11cc-7021-4912-98b8-ecbfa8699a64 /service-manual/user-centred-design/know-your-users.html exact /service-manual/user-centred-design/user-needs),
      %w(c100c12d-9dc6-49a2-8d05-086acc8fcab9 /service-manual/user-centred-design/introduction-to-user-research exact /service-manual/user-centred-design/user-research),
      %w(8f3a5533-b750-4efb-be5e-420719566815 /service-manual/user-centred-design/introduction-to-user-research.html exact /service-manual/user-centred-design/user-research),
      %w(8c268f59-18ed-4af3-8e41-91271e0adc52 /transformation/property-register prefix /transformation/land-registry),
    ].each(&helper.method(:publish_redirect))
  end
end

desc "Temporary alias of publishing_api:publish_special_routes for backward compatibility"
task "router:register" => "publishing_api:publish_special_routes"
