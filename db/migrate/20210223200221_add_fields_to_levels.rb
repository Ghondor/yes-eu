class AddFieldsToLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :levels, :title, :string
  end
end
