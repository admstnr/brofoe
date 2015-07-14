class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :parent_id
      t.string :body
      t.integer :status

      t.timestamps null: false
    end
  end
end
