class RemoveUniqueContraintFromUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_index :company_users, :user_id
    add_index :company_users, :user_id
  end
end
