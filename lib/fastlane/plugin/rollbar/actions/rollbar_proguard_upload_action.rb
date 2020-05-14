# frozen_string_literal: true

require 'fastlane/action'
require_relative '../helper/rollbar_helper'

module Fastlane
  module Actions
    class RollbarProguardUploadAction < Action
      def self.run(params)
        Helper::RollbarHelper.upload_proguard(
          params[:api_key],
          params[:proguard_path],
          params[:code_version],
          params[:environment],
        )
      end

      def self.description
        'Helps to upload Proguard mappings to Rollbar'
      end

      def self.authors
        ['Evgrafov Denis']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        'Helps to upload Proguard mappings to Rollbar'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key, description: 'Rollbar API key', optional: false, type: String),
          FastlaneCore::ConfigItem.new(key: :proguard_path, description: 'Proguard mapping path', optional: false, type: String),
          FastlaneCore::ConfigItem.new(key: :code_version, description: 'Code version', optional: false, type: String),
          FastlaneCore::ConfigItem.new(key: :environment, description: 'Environment', optional: false, type: String),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        %i[ios android].include?(platform)
        true
      end
    end
  end
end
