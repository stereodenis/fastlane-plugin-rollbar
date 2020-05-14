# frozen_string_literal: true

describe Fastlane::Actions::RollbarAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with('The rollbar plugin is working!')

      Fastlane::Actions::RollbarAction.run(nil)
    end
  end
end
