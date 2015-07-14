class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps null: false
    end

    #create_join_table :users, :groups
    create_table :user_groups, :id => false do |t| 
      t.integer :user_id 
      t.integer :group_id 
    end 
  end
end
