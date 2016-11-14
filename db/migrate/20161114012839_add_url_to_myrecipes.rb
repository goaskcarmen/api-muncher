class AddUrlToMyrecipes < ActiveRecord::Migration
  def change
    add_column :myrecipes, :url, :string

  end
end
