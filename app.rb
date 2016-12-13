
require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pry-nav')
require('pg')
