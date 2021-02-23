class AddFieldsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :question_title, :text
    add_column :questions, :first_answer, :string
    add_column :questions, :second_answer, :string
    add_column :questions, :third_answer, :string
    add_column :questions, :correct_answer, :integer
  end
end
