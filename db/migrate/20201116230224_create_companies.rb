class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :companies, :name
  end
end
