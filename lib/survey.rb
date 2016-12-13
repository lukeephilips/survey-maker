class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:to_titlecase)
  validates(:title, {:presence => true})
  validates :title, {:uniqueness => true}
  validates :title, uniqueness: { case_sensitive: false }





private

  define_method(:to_titlecase) do
    self.title =(title().titlecase())
  end
end
