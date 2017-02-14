class AddAttachmentImageToMisions < ActiveRecord::Migration
  def self.up
    change_table :misions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :misions, :image
  end
end
