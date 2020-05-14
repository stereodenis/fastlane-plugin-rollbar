# frozen_string_literal: true

require 'fastlane/action'
require_relative '../helper/rollbar_helper'

module Fastlane
  module Actions
    class RollbarReportDeployAction < Action
      def self.run(params)
        Helper::RollbarHelper.report_deploy(
          params[:api_key],
          params[:environment],
          params[:revision],
        )
      end

      def self.description
        'Helps to report deploy to Rollbar'
      end

      def self.authors
        ['Evgrafov Denis']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        'Helps to report deploy to Rollbar'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key, description: 'Rollbar API key', optional: false, type: String),
          FastlaneCore::ConfigItem.new(key: :environment, description: 'Environment', optional: false, type: String),
          FastlaneCore::ConfigItem.new(key: :revision, description: 'Git SHA of revision being deployed', optional: false, type: String),
          # FastlaneCore::ConfigItem.new(key: :bundle_identifier, description: 'Bundle identifier', optional: false, type: String)
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
