class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :l_linkedin
      t.string :a_linkedin
      t.string :l_facebook
      t.string :a_facebook
      t.string :l_twitter
      t.string :a_twitter
      t.string :l_google
      t.string :a_google
      t.string :l_github
      t.string :a_github

      t.timestamps null: false
    end
  end
end
