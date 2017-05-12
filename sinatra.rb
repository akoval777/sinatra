require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    get '/' do
      'Hello'
    end

    get '/redirect' do
      redirect to('/hello/World')
    end

    get %r{/hello/([\w]+)} do |c|
      "Hello #{c}"
    end

    get '/say/*/to/*' do
      params['splat'].to_s
    end

    get '/jobs.?:format?' do
      'Работает'
    end

    get '/hello/:name' do
      "Sinatra приветствует тебя, #{params[:name]}"
    end

    namespace '/api/v1' do
      get '/*' do
        "I dont know what is the #{params[:splat]}"
      end
    end
  end
end
