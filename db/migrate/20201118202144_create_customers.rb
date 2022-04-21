class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
