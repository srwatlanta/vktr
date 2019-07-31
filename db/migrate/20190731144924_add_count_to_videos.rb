class AddCountToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :count, :integer
  end
end
