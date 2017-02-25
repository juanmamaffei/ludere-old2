class Grupo < ApplicationRecord
	has_many :posts
	has_many :usuarios
	has_many :misions
end
