class AddListContentIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :list_contents, %i[list_id content_id], unique: true
  end
end
