module PermisosConcern
	extend ActiveSupport::Concern
	
	#Métodos que permitan controlar los eventos del usuario

	def es_alumno?
		self.permisos >= 1
	end
	
	def es_tutor?
		self.permisos >=2
	end

	def es_docente?
		self.permisos >= 5
	end

	def es_admin?
		self.permisos >=7
	end
end