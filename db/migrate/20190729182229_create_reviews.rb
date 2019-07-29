class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :kill_rating
      
      t.belongs_to :user
      t.belongs_to :video
      t.timestamps
    end
  end
end
