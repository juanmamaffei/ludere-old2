class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :misiones
  has_many :estrellas
  acts_as_voter #Para agregar a Mis Misiones


  include PermisosConcern


end
