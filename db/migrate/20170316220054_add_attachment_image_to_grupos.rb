class AddAttachmentImageToGrupos < ActiveRecord::Migration
  def self.up
    change_table :grupos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :grupos, :image
  end
end
