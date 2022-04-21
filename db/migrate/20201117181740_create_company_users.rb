class CreateCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :company_users do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
