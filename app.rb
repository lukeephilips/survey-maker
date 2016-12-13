
require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pry-nav')
require('pg')

get '/' do
  @surveys = Survey.all
  erb(:index)
end

post '/surveys/new' do
  binding.pry
  Survey.create({:title => params.fetch('survey_title')})
  @surveys = Survey.all
  erb(:index)
end
