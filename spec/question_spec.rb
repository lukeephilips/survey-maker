require('spec_helper')

describe(Question) do
  before do
    @survey = Survey.create(:title => 'Shopper Survey')
    @question1 = Question.create(:title => 'name', :description => 'What is your name?', :question_type => 'text', :survey_id => @survey.id)
  end

  describe('#questions') do
    it ('allows saving a question to a survey') do
      expect(@survey.questions()).to(eq([@question1]))
    end
  end
end
