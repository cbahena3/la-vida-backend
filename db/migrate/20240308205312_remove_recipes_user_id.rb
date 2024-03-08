class RemoveRecipesUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :user_id
  end
end
