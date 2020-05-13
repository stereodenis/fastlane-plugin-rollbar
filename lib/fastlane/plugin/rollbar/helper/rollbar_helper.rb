# frozen_string_literal: true

require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?('UI')
  API_URL = 'https://api.rollbar.com/api/1'.freeze
  API_SOURCEMAP_URL = "#{API_URL}/sourcemap".freeze
  API_DSYM_URL = "#{API_URL}/dsym".freeze
  API_PROGUARD_URL = "#{API_URL}/proguard".freeze
  API_DEPLOY_URL = "#{API_URL}/deploy".freeze

  module Helper
    class RollbarSourcemapsUploadHelper
      # class methods that you define here become available in your action
      # as `Helper::RollbarSourcemapsUploadHelper.your_method`
      #
      def self.create_bundle(os)
        UI.message('Creating React Native bundle')
        jsbundle = os == 'ios' ? 'main.jsbundle' : 'index.android.bundle'
        assets_dest = os == 'ios' ? 'ios' : 'android/app/src/main/res/'
        Action.sh("react-native bundle \
          --platform #{os} \
          --dev false \
          --entry-file index.js \
          --bundle-output /tmp/#{jsbundle} \
          --assets-dest #{assets_dest} \
          --sourcemap-output ./tmp/sourcemap.#{os}.js \
          --sourcemap-sources-root ./")
      end

      def self.upload_bundle(api_key, os, code_version, environment)
        UI.message('Uploading React Native bundle to Rollbar')
        jsbundle = os == 'ios' ? 'main.jsbundle' : 'index.android.bundle'
        Action.sh("curl #{API_SOURCEMAP_URL} \
          -F access_token=#{api_key} \
          -F version=#{code_version}.#{os} \
          -F minified_url=http://reactnativehost/#{jsbundle} \
          -F environment=#{environment} \
          -F source_map=@tmp/sourcemap.#{os}.js \
          -F index.js=@index.js")
      end

      def self.upload_dsym(api_key, dsym_path, code_version, bundle_identifier, environment)
        UI.message('Uploading Dsym to Rollbar')
        Action.sh("curl -X POST #{API_DSYM_URL} \
          -F access_token=#{api_key} \
          -F version=#{code_version}.ios \
          -F bundle_identifier=#{bundle_identifier} \
          -F environment=#{environment} \
          -F dsym=@#{dsym_path}")
      end

      def self.upload_proguard(api_key, proguard_path, code_version, environment)
        UI.message('Uploading Proguard mapping to Rollbar')
        Action.sh("curl #{API_PROGUARD_URL} \
          -F access_token=#{api_key} \
          -F version=#{code_version}.android \
          -F environment=#{environment} \
          -F mapping=@#{proguard_path}")
      end

      def self.report_deploy(api_key, environment, revision)
        UI.message('Report deploy to Rollbar')
        Action.sh("curl #{API_DEPLOY_URL} \
          -F access_token=#{api_key} \
          -F environment=#{environment} \
          -F revision=#{revision}")
      end

      def self.show_message
        UI.message('Hello from the rollbar plugin helper!')
      end
    end
  end
end
