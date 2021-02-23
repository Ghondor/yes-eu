class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
