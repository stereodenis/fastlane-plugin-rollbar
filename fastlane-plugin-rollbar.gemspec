# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/rollbar/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-rollbar'
  spec.version       = Fastlane::Rollbar::VERSION
  spec.author        = 'Evgrafov Denis'
  spec.email         = 'stereodenis@gmail.com'

  spec.summary       = 'Helps to upload sourcemaps/dsyms/proguard mapping/deploy report to Rollbar'
  spec.homepage      = 'https://github.com/stereodenis/fastlane-plugin-rollbar'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '> 2.4.2'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.146.1')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
