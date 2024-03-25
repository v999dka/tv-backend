class AddListContentModel < ActiveRecord::Migration[7.1]
  def change
    create_table :list_contents do |t|
      t.references :list, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
