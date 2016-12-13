class CreateQuestionTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:questions) do |t|
      t.column(:title, :string)
      t.column(:description, :string)
      t.column(:user_content, :string)
      t.column(:type, :string)
      t.column(:survey_id, :integer)
    end
  end
end
