class AddMoreChoices < ActiveRecord::Migration[5.0]
  def change
    add_column(:questions, :choice2, :string)
    add_column(:questions, :choice3, :string)
    add_column(:questions, :choice4, :string)
  end
end
