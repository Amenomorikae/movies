class AddPostImageIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :post_image_id, :string
  end
end
