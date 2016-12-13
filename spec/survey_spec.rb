require('spec_helper')

describe(Survey) do
  before() do
    @new_survey = Survey.create({:title => "shopper survey"})
  end

  describe('#title') do
    it('will return the title of the survey') do
      new_survey = Survey.create({:title => "Shopper survey"})
      expect(new_survey.title()).to(eq("Shopper Survey"))
    end

    it("ensure the user gives the survey a title") do
      test_survey = Survey.create({:title => " "})
      expect(test_survey.save()).to(eq(false))
    end

    it("convert the title of the survey to titlecase") do
      expect(@new_survey.title()).to(eq("Shopper Survey"))
    end
  end
end
