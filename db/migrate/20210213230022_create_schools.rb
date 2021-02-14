class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
