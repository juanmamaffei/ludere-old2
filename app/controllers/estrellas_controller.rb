class EstrellasController < ApplicationController
	#Dar PRIMERA estrella en nuevo objetivo. Crear, siempre que no exista el registro previamente
	def nueva
		@estrella = Estrella.new
	end

	def crear
		#comprobar si el ya existe ese idusuario con ese idobjetivo
		aux= params["estrella"]
		@verificador = Estrella.find_by(idusuario_id: aux[:idusuario_id], idobjetivo_id: aux[:idobjetivo_id])

		if @verificador == nil

				#Puede crear un PROFESOR
		 		@estrella = Estrella.new(star_params)

		 		#Puede darla el sistema automáticamente.
		 		#Se disparará con un evento después de terminar de ver un video de objetivo. Enviará idusuario, idobjetivo y se le otorgará EST1 por POSRT.


		 		respond_to do |format|
				    if @estrella.save
				        format.html { redirect_to misions_path } #Redireccionar al objetivo
				    else
				        format.html { render :queonda, notice: 'Hubo un error' } #Redireccionar a página de error
				    end
			    end
		else
			render :queonda, notice: 'El registro está duplicado'
    	end
	end


	#Dar estrella. Actualizar, si ya existe el registro previamente
	def darestrellas
		#Las puede dar un usuario con privilegios de PROFESOR


		#Las puede dar el sistema automáticamente (TODAVÍA NO)
	end
	#Index de todas las estrellas, filtrando por usuario


	#Index de todas las estrellas, filtrado por usuario y por objetivo (para mostrar en cada objetivo)


	private
		def star_params
			params.require(:estrella).permit(:idusuario_id, :idobjetivo_id, :est1, :est2, :est3)
		end
end
