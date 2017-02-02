class AddAttachmentImageToAdverts < ActiveRecord::Migration
  def self.up
    change_table :adverts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :adverts, :image
  end
end
