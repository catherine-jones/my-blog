class AddCategoriesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :categories, :string
    has_many :categories
  end
end
