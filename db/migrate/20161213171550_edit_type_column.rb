class EditTypeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column(:questions, :type)
    add_column(:questions, :question_type, :string)
  end
end
