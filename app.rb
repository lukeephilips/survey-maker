
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
  @new_item = Survey.create({:title => params.fetch('survey_title')})
  if @new_item.save()
    @surveys = Survey.all
    erb(:index)
  else
    erb(:error)
  end
end

delete '/survey/:id/delete' do
  id_to_delete = params.fetch("id").to_i
  to_delete = Survey.find(id_to_delete)
  to_delete.destroy
  @surveys = Survey.all
  erb(:index)
end

get ('/survey/:id') do
  @survey = Survey.find(params['id'])
  erb(:survey)
end
