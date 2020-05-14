# frozen_string_literal: true

describe Fastlane::Actions::RollbarSourcemapsUploadAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with('The rollbar plugin is working!')

      Fastlane::Actions::RollbarSourcemapsUploadAction.run(nil)
    end
  end
end
