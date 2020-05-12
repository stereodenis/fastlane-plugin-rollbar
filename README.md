# rollbar_sourcemaps_upload plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-rollbar_sourcemaps_upload)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-rollbar_sourcemaps_upload`, add it to your project by running:

```bash
fastlane add_plugin rollbar_sourcemaps_upload
```

## About rollbar_sourcemaps_upload

Helps to upload sourcemaps to Rollbar

## Example

```
rollbar_sourcemaps_upload(
  api_key: 'YOUR_ROLLBAR_SERVER_API_KEY',
  os: ['ios', 'android'],
  code_version: 'your_code_version'
)

rollbar_dsym_upload(
  api_key: 'YOUR_ROLLBAR_SERVER_API_KEY',
  dsym_path: '/path/to/dsym.zip',
  code_version: 'your_code_version',
  bundle_identifier: 'YOUR_BUNDLE_IDENTIFIER',
)

rollbar_proguard_upload(
  api_key: 'YOUR_ROLLBAR_SERVER_API_KEY',
  proguard_path: /path/to/mapping.txt,
  code_version: 'your_code_version',
)
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
