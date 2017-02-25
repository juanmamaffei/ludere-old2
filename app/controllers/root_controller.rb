class RootController < ApplicationController
	def index
		@estrellas = Estrella.select("idobjetivo_id", "idusuario_id", "est1", "est2", "est3").where(:idusuario_id == current_usuario)
		render layout: "root"
	end

end
