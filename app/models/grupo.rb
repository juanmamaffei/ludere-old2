class Grupo < ApplicationRecord
	has_many :posts
	has_many :usuarios
	has_many :misions

	serialize :integrantes, Array
	serialize :administradores, Array
	serialize :misiones, Array
	serialize :revision, Array

	#Paperclip
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
