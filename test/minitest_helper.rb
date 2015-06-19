chandler_lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(chandler_lib)

if ENV["TRAVIS"]
  require "coveralls"
  Coveralls.wear!
  # Eager load the entire lib directory so that SimpleCov is able to report
  # accurate code coverage metrics.
  at_exit { Dir["#{chandler_lib}/**/*.rb"].each { |rb| require(rb) } }
end

require "minitest/autorun"

require "minitest/reporters"
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

require "mocha/mini_test"
Mocha::Configuration.warn_when(:stubbing_non_existent_method)
Mocha::Configuration.warn_when(:stubbing_non_public_method)