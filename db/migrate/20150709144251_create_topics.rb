class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :post_topics, :id => false do |t| 
      t.integer :post_id 
      t.integer :topic_id 
    end 
  end
end
