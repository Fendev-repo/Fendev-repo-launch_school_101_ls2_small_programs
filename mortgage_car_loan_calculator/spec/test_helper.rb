require 'minitest/autorun'
require 'color_pound_spec_reporter'

Minitest::Reporters.use! [ColorPoundSpecReporter.new]
