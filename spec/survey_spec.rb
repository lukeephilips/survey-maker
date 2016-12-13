require('spec_helper')

describe(Survey) do
  before() do
    @new_survey = Survey.create({:title => "Shopper Survey"})
  end

  describe('#title') do
    it('will return the title of the survey') do
      new_survey = Survey.create({:title => "Shopper survey"})
      expect(new_survey.title()).to(eq("Shopper survey"))
    end

    it("ensure the user gives the survey a title") do
      test_survey = Survey.create({:title => " "})
      expect(test_survey.save()).to(eq(false))
    end
  end
end
