#!/usr/bin/env groovy

REPOSITORY = 'design-principles'
GOVUK_APP_NAME = 'designprinciples'

node {
  def govuk = load '/var/lib/jenkins/groovy_scripts/govuk_jenkinslib.groovy'

  try {
    stage("Checkout") {
      checkout scm
    }

    stage("Prepare build") {
      govuk.cleanupGit()
      govuk.setEnvar('RAILS_ENV', 'test')
      govuk.setEnvar('GOVUK_APP_DOMAIN', 'test.gov.uk')
    }

    stage("Install dependencies") {
      govuk.bundleApp()
    }

    stage("Tests") {
      sh "bundle exec rake"
      sh "bundle exec rake assets:precompile"
    }

    if (env.BRANCH_NAME == 'master') {
      stage("Push release tag") {
        govuk.pushTag(REPOSITORY, env.BRANCH_NAME, 'release_' + env.BUILD_NUMBER)
      }

      stage("Deploy to integration") {
        govuk.deployIntegration(GOVUK_APP_NAME, env.BRANCH_NAME, 'release_' + env.BUILD_NUMBER, 'deploy')
      }
    }

  } catch (e) {
    currentBuild.result = "FAILED"
    step([$class: 'Mailer',
          notifyEveryUnstableBuild: true,
          recipients: 'govuk-ci-notifications@digital.cabinet-office.gov.uk',
          sendToIndividuals: true])
    throw e
  }

}
