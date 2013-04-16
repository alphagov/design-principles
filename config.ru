# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack/rewrite'

use Rack::Rewrite do
  r301 '/service-manual/making-software/open-source.html', '/service-manual/making-software/choosing-technology'
  r301 '/service-manual/making-software/open-source', '/service-manual/making-software/choosing-technology'
  r301 '/service-manual/measurement/completionrate.html', '/service-manual/measurement/completion-rate'
  r301 '/service-manual/measurement/costpertransaction.html', '/service-manual/measurement/cost-per-transaction'
  r301 '/service-manual/measurement/performanceframework.html', '/service-manual/measurement/performance-framework'
  r301 '/service-manual/measurement/usersatisfaction.html', '/service-manual/measurement/user-satisfaction'
  r301 '/service-manual/users/user-research/communityusergroups.html', '/service-manual/users/user-research/community-user-groups'
  r301 '/service-manual/users/user-research/discussionguides.html', '/service-manual/users/user-research/discussion-guides'
  r301 '/service-manual/users/user-research/ethnographicresearch.html', '/service-manual/users/user-research/ethnographic-research'
  r301 '/service-manual/users/user-research/expertreview.html', '/service-manual/users/user-research/expert-review'
  r301 '/service-manual/users/user-research/focusgroupsminigroupsandinterviews.html', '/service-manual/users/user-research/focus-groups-mini-groups-interviews'
  r301 '/service-manual/users/user-research/guerillatesting.html', '/service-manual/users/user-research/guerilla-testing'
  r301 '/service-manual/users/user-research/labbasedusertesting.html', '/service-manual/users/user-research/lab-based-user-testing'
  r301 '/service-manual/users/user-research/multivariatetesting.html', '/service-manual/users/user-research/multivariate-testing'
  r301 '/service-manual/users/user-research/onlineomnibussurvey.html', '/service-manual/users/user-research/online-omnibus-survey'
  r301 '/service-manual/users/user-research/onlineresearchpanels.html', '/service-manual/users/user-research/online-research-panels'
  r301 '/service-manual/users/user-research/remoteusability.html', '/service-manual/users/user-research/remote-usability'
  r301 '/service-manual/users/user-research/samedayusertesting.html', '/service-manual/users/user-research/same-day-user-testing'
  r301 '/service-manual/users/user-research/samplingmethodologies.html', '/service-manual/users/user-research/sampling-methodologies'
  r301 '/service-manual/users/user-research/sentimentanalysis.html', '/service-manual/users/user-research/sentiment-analysis'
  r301 '/service-manual/users/user-research/surveydesign.html', '/service-manual/users/user-research/survey-design'
  r301 '/service-manual/users/user-research/userresearchbriefs.html', '/service-manual/users/user-research/user-research-briefs'
  r301 '/service-manual/users/user-research/userresearchsurveys.html', '/service-manual/users/user-research/user-research-surveys'
  r301 '/service-manual/users/user-research/userresearchtools.html', '/service-manual/users/user-research/user-research-tools'
end

run DesignPrinciples::Application
