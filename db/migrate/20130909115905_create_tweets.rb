class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :status
      t.belongs_to :twitter_user # t.integer :twitter_user_id is the same
      t.timestamps
    end
  end
end
  
