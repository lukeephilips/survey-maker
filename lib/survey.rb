class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {:presence => true})
  before_save(:to_titlecase)



private

  define_method(:to_titlecase) do
    self.title =(title().titlecase())
  end
end
