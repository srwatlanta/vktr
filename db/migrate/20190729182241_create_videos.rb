class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_url
      t.string :img_url

      t.belongs_to :artist
      t.belongs_to :director
      t.belongs_to :genre
      t.timestamps
    end
  end
end
