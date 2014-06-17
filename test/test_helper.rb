require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'bundler/setup'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'

Bundler.require

class TestHelper < Minitest::Unit::TestCase
end
