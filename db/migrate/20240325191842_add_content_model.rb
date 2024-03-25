class AddContentModel < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :original_title
      t.string :type
      t.integer :number
      t.integer :year
      t.integer :parent_id

      t.timestamps
    end
  end
end
