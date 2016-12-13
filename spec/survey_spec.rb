require('spec_helper')

describe(Survey) do
  before() do
    @new_survey = Survey.create({:title => "shopper survey"})
  end

  describe('#title') do
    it('will return the title of the survey') do
      new_survey = Survey.create({:title => "Test survey"})
      expect(new_survey.title()).to(eq("Test Survey"))
    end

    it("ensure the user gives the survey a title") do
      test_survey = Survey.create({:title => " "})
      expect(test_survey.save()).to(eq(false))
    end

    it("convert the title of the survey to titlecase") do
      expect(@new_survey.title()).to(eq("Shopper Survey"))
    end
    it("ensures all surveys have unique names") do
      failing_survey = Survey.new({:title => "SHOPPER Survey"})
      expect(failing_survey.save()).to(eq(false))
    end
  end
end
