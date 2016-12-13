
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

patch ('/survey/:id') do
  @new_item = Survey.find(params['id'])
  @new_item.update({:title => params['survey_title']})
  if @new_item.save()
    @surveys = Survey.all
    erb(:index)
  else
    erb(:error)
  end
end

get '/:id/questions/new' do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:question)
end

post '/:id/question' do
  @survey = Survey.find(params.fetch('id').to_i)
  title = params.fetch('question_title')
  desc = params.fetch('question_desc')
  question_type = params.fetch('question_type')
  new_question = Question.create({:title => title, :description => desc, :question_type => question_type, :survey_id => @survey.id()})
  @questions = Question.all
  erb(:question)
end

delete '/:id/question/delete' do
  @survey = Survey.find(params.fetch('id').to_i)
  question = Question.find(params.fetch('question_id').to_i)
  question.destroy()

  @questions = Question.all
  erb(:question)
end
