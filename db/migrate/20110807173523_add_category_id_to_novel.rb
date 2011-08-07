class AddCategoryIdToNovel < ActiveRecord::Migration
  def change
    add_column :novels, :category_id, :integer
  end
end
