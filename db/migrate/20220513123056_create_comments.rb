class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :user
      t.text :comment
      t.integer :likes_count
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
