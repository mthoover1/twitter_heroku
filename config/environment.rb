ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'twitter'
require 'rubygems'
require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

require APP_ROOT.join('config', 'database')

Twitter.configure do |config|
  config.consumer_key = 'iQQlysrvG8tDWoWETdVCuQ'
  config.consumer_secret = 'X115VnsTax7cutyPAAuwku3yjI3tiBjg10KBiQQAaw'
  config.oauth_token = '953904672-QMwVQlL52Ew3EhDP503BwVgn2jU4qeEFbDh33293'
  config.oauth_token_secret = '3r2rhmhOL9D9Qm0n03BWCCuQCMpvaxLUTPP20mMjc'
end

# configure :development do
#   use BetterErrors::Middleware
#   BetterErrors.application_root = APP_ROOT
# end

