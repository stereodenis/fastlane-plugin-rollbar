require 'spec_helper'

describe Fastlane::Actions::RollbarSourcemapsUploadAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with('Creating React Native bundle')
      expect(Fastlane::UI).to receive(:message).with('Uploading React Native bundle to Rollbar')

      Fastlane::Actions::RollbarSourcemapsUploadAction.run(
        os: 'android',
        api_key: 'abc',
        code_version: '1.0.0',
        environment: 'production'
      )
    end
  end
end
