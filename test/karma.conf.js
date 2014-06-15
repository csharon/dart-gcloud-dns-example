module.exports = function(config) {
  config.set({
    basePath: '..',
    frameworks: ['dart-unittest'],

    // list of files / patterns to load in the browser
    files: [
      'test/dns_editor_tests.dart',
      'test/unit/dns/gcloud_dns_lib_test.dart',
      {pattern: '**/*.dart', watched: false, included: false, served: true},
      {pattern: '**/*.html', watched: false, included: false, served: true},
      {pattern: 'packages/browser/dart.js', watched: false, included: true, served: true}
    ],

    autoWatch: true,

    plugins: [
      'karma-dart',
      'karma-chrome-launcher'
    ],
    browsers: ['Dartium']
  });
};