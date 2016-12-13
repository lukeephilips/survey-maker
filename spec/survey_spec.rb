require('spec_helper')

describe('#title') do
  it('will return the title of the survey') do
    new_survey = Survey.create({:title => "Shopper survey"})
    expect(new_survey.title()).to(eq("Shopper survey"))
  end
end
