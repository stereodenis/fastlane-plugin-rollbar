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
          params[:local_username],
          params[:rollbar_username],
          params[:comment],
          params[:status]
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
          FastlaneCore::ConfigItem.new(
            key: :revision,
            description: 'Git SHA of revision being deployed',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :rollbar_username,
            description: 'Rollbar username of person who deployed',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :local_username,
            description:
              'Local username of person who deployed. Displayed in web app if no rollbar_username was specified',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :comment,
            description: 'Additional text to include with the deploy',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :status,
            description: 'Status of the deployment - started, succeeded (default), failed, or timed_out',
            optional: true,
            type: String
          )
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
