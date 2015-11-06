class AddCategoryIdToWikis < ActiveRecord::Migration
  def change
    add_reference :wikis, :category, index: true, foreign_key: true
  end
end
