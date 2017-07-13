require_relative "#{Dir.pwd}/controllers/tweets.rb"
# require 'capybara'
# require 'capybara/cucumber'
# require 'capybara/dsl'
# require 'capybara/poltergeist'
require 'httparty'
require 'rspec'
# require 'selenium-webdriver'
# require 'site_prism'
# require 'webmock/cucumber'
require 'webmock/cucumber'

WebMock.allow_net_connect!

# Capybara.default_max_wait_time = 10
# Capybara.default_driver = :poltergeist

# Capybara.register_driver :selenium do |app|
#     Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# Capybara.register_driver :poltergeist do |app|
#     options = {
#         :js_errors => false,
#         :timeout => 10,
#         # :debug => true,
#         # :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
#         # :inspector => true
#     }
#     Capybara::Poltergeist::Driver.new(app, options)
# end

# World(Capybara)
