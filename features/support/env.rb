require_relative "#{Dir.pwd}/controllers/locaweb_tweets_controller.rb"

require 'faraday'
require 'rspec'
require 'simplecov'
require 'webmock/cucumber'

SimpleCov.start
WebMock.allow_net_connect!
