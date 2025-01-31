class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
