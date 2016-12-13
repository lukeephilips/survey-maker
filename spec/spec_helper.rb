ENV['RACK_ENV']  = 'test'

Rspec.configure do |config|
  confif.after(:each) do
    Question.all.each() do |question|
      question.destroy()
    end
    Survey.all.each() do |survey|
      survey.destroy()
    end
  end
end
