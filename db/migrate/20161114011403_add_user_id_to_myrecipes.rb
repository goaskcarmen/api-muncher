class AddUserIdToMyrecipes < ActiveRecord::Migration
  def change
    add_column :myrecipes, :user_id, :integer
  end
end
