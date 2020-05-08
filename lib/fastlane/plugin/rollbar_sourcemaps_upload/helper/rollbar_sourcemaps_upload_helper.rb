# frozen_string_literal: true

require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?('UI')
  API_SOURCEMAP_URL = 'https://api.rollbar.com/api/1/sourcemap'.freeze

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

      def self.upload_bundle(api_key, os, code_version)
        UI.message('Uploading React Native bundle to Rollbar')
        jsbundle = os == 'ios' ? 'main.jsbundle' : 'index.android.bundle'
        Action.sh("curl #{API_SOURCEMAP_URL} \
          -F access_token=#{api_key} \
          -F version=#{code_version}.#{os} \
          -F minified_url=http://reactnativehost/#{jsbundle} \
          -F source_map=@tmp/sourcemap.#{os}.js \
          -F index.js=@index.js")
      end

      def self.show_message
        UI.message('Hello from the rollbar_sourcemaps_upload plugin helper!')
      end
    end
  end
end
