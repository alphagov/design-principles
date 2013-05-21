# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack/rewrite'

use Rack::Rewrite do
  r301 %r{/service-manual/about.html(\?.*)?}, '/service-manual/start$1'
  r301 %r{/service-manual/agile/spending-controls.html(\?.*)?}, '/service-manual/technology/spending-controls$1'
  r301 %r{/service-manual/agile/spending-controls(\?.*)?}, '/service-manual/technology/spending-controls$1'
  r301 %r{/service-manual/making-software/open-source(\?.*)?}, '/service-manual/making-software/choosing-technology$1'
  r301 %r{/service-manual/making-software/open-source.html(\?.*)?}, '/service-manual/making-software/choosing-technology$1'
  r301 %r{/service-manual/measurement/completionrate.html(\?.*)?}, '/service-manual/measurement/completion-rate$1'
  r301 %r{/service-manual/measurement/costpertransaction.html(\?.*)?}, '/service-manual/measurement/cost-per-transaction$1'
  r301 %r{/service-manual/measurement/performanceframework.html(\?.*)?}, '/service-manual/measurement/other-kpis$1'
  r301 %r{/service-manual/measurement/performance-framework.html(\?.*)?}, '/service-manual/measurement/other-kpis$1'
  r301 %r{/service-manual/measurement/performance-framework(\?.*)?}, '/service-manual/measurement/other-kpis$1'
  r301 %r{/service-manual/measurement/usersatisfaction.html(\?.*)?}, '/service-manual/measurement/user-satisfaction$1'
  r301 %r{/service-manual/digital-by-default/providing-evidence.html(\?.*)?}, '/service-manual/communications$1'
  r301 %r{/service-manual/the-team/transformation-partner.html(\?.*)?}, '/service-manual/the-team/working-with-specialists$1'
  r301 %r{/service-manual/users/user-research/communityusergroups.html(\?.*)?}, '/service-manual/users/user-research/community-user-groups$1'
  r301 %r{/service-manual/users/user-research/discussionguides.html(\?.*)?}, '/service-manual/users/user-research/discussion-guides$1'
  r301 %r{/service-manual/users/user-research/ethnographicresearch.html(\?.*)?}, '/service-manual/users/user-research/ethnographic-research$1'
  r301 %r{/service-manual/users/user-research/expertreview.html(\?.*)?}, '/service-manual/users/user-research/expert-review$1'
  r301 %r{/service-manual/users/user-research/focusgroupsminigroupsandinterviews.html(\?.*)?}, '/service-manual/users/user-research/focus-groups-mini-groups-interviews$1'
  r301 %r{/service-manual/users/user-research/guerillatesting.html(\?.*)?}, '/service-manual/users/user-research/guerilla-testing$1'
  r301 %r{/service-manual/users/user-research/labbasedusertesting.html(\?.*)?}, '/service-manual/users/user-research/lab-based-user-testing$1'
  r301 %r{/service-manual/users/user-research/multivariatetesting.html(\?.*)?}, '/service-manual/users/user-research/multivariate-testing$1'
  r301 %r{/service-manual/users/user-research/onlineomnibussurvey.html(\?.*)?}, '/service-manual/users/user-research/online-omnibus-survey$1'
  r301 %r{/service-manual/users/user-research/onlineresearchpanels.html(\?.*)?}, '/service-manual/users/user-research/online-research-panels$1'
  r301 %r{/service-manual/users/user-research/remoteusability.html(\?.*)?}, '/service-manual/users/user-research/remote-usability$1'
  r301 %r{/service-manual/users/user-research/samedayusertesting.html(\?.*)?}, '/service-manual/users/user-research/same-day-user-testing$1'
  r301 %r{/service-manual/users/user-research/samplingmethodologies.html(\?.*)?}, '/service-manual/users/user-research/sampling-methodologies$1'
  r301 %r{/service-manual/users/user-research/sentimentanalysis.html(\?.*)?}, '/service-manual/users/user-research/sentiment-analysis$1'
  r301 %r{/service-manual/users/user-research/surveydesign.html(\?.*)?}, '/service-manual/users/user-research/survey-design$1'
  r301 %r{/service-manual/users/user-research/userresearchbriefs.html(\?.*)?}, '/service-manual/users/user-research/user-research-briefs$1'
  r301 %r{/service-manual/users/user-research/userresearchsurveys.html(\?.*)?}, '/service-manual/users/user-research/user-research-surveys$1'
  r301 %r{/service-manual/users/user-research/userresearchtools.html(\?.*)?}, '/service-manual/users/user-research/user-research-tools$1'
end

run DesignPrinciples::Application
