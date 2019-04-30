class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name 
      t.text :content
      t.integer :users_id
    end
  end 
end 