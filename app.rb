
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

post '/surveys/:id/submit' do
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.questions.each do |question|
    q_id = question.id()

    q_title = question.title
    q_user_content = params.fetch("user_content_#{question.id}")
  end

  title = params.fetch('question_title')
  desc = params.fetch('question_desc')
  question_type = params.fetch('question_type')
  new_question = Question.create({:title => title, :description => desc, :question_type => question_type, :survey_id => @survey.id()})
  @questions = Question.all
  erb(:question)
end

get '/:id/questions/new' do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:question)
end

post '/:id/question/multi_add' do
  @survey = Survey.find(params.fetch('id').to_i)
  @question = Question.find(params.fetch('question_id').to_i)
  @question.update({:choice => params.fetch('choice')})
  @question.update({:choice2 => params.fetch('choice2')})
  @question.update({:choice3 => params.fetch('choice3')})
  @question.update({:choice4 => params.fetch('choice4')})
   erb(:question_form_MC)
 end

post '/:id/question' do
  @survey = Survey.find(params.fetch('id').to_i)
  title = params.fetch('question_title')
  desc = params.fetch('question_desc')
  question_type = params.fetch('question_type')
  @question = Question.create({:title => title, :description => desc, :question_type => question_type, :survey_id => @survey.id()})

  if question_type == 'multiple_choice'
    erb(:question_form_MC)
  else
    @questions = Question.all
    erb(:question)
  end
end

delete '/:id/question/delete' do
  @survey = Survey.find(params.fetch('id').to_i)
  question = Question.find(params.fetch('question_id').to_i)
  question.destroy()

  @questions = Question.all
  erb(:question)
end
