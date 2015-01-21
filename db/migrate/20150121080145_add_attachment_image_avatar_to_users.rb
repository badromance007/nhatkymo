class AddAttachmentImageAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image_avatar
    end
  end

  def self.down
    remove_attachment :users, :image_avatar
  end
end
