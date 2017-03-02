class Grupo < ApplicationRecord
	has_many :posts
	has_many :usuarios
	has_many :misions

	serialize :integrantes, Array
	serialize :administradores, Array
	serialize :misiones, Array
end
