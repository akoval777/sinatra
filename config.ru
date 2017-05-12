# require './sinatra'
# run Sinatra::Application

#bundle exec rackup -p 4567 config.ru

root = File.expand_path File.dirname(__FILE__)
require File.join(root, 'sinatra.rb')

app = Rack::Builder.app do
  run MyAppModule::App
end

run app
