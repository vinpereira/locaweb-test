require_relative "#{Dir.pwd}/controllers/tweets.rb"

require 'httparty'
require 'rspec'
require 'simplecov'
require 'webmock/cucumber'

SimpleCov.start
WebMock.allow_net_connect!
