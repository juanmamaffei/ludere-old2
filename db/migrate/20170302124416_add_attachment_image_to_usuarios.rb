class AddAttachmentImageToUsuarios < ActiveRecord::Migration
  def self.up
    change_table :usuarios do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :usuarios, :image
  end
end
