# app.rb

# https://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/

require 'sinatra'
require 'sinatra/cross_origin'
require 'sinatra/config_file'
require 'json'
require 'rack'

require_relative 'helpers'
require_relative 'routes/general'
require_relative 'routes/books'
require_relative 'book_ids'

class MockServerApp < Sinatra::Base
  #Need to have sinatra-contrib to get this working, http://sinatrarb.com/contrib/config_file
  register Sinatra::ConfigFile
  config_file 'settings.yml'

  helpers Sinatra::MockServerApp::Helpers

configure do
  register Sinatra::MockServerApp::Routing::General
  register Sinatra::MockServerApp::Routing::Books

  register Sinatra::CrossOrigin

  #http://sinatrarb.com/configuration.html
  enable :logging
  #https://github.com/britg/sinatra-cross_origin
  enable :cross_origin

  #sinatra/rack-protection/
  #https://github.com/sinatra/sinatra/blob/1b0edc0aeaaf4839cadfcec1b21da86e6af1d4c0/rack-protection/lib/rack/protection.rb
  set :protection, :except => [:json_csrf]
  set :allow_origin, :any
  set :allow_methods, [:get, :post, :options]
  set :allow_credentials, true
  set :max_age, "1728000"
  set :expose_headers, ['Content-Type']
end

  #https://github.com/britg/sinatra-cross_origin, Responding to OPTIONS
  #Essentially, the below ensures that the app properly responds to any OPTIONS requests
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS,PATCH"
    response.headers['Access-Control-Allow-Methods'] = "POST,PUT,DELETE,GET,OPTIONS,PATCH"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, Authorization"
    200
  end

end
