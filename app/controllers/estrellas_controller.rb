class EstrellasController < ApplicationController
	before_action :validarusuario, except: [:show]
  	before_action :validaradmin, except: [:crearauto]

	#Dar PRIMERA estrella en nuevo objetivo. Crear, siempre que no exista el registro previamente
	def nueva
		@estrella = Estrella.new
	end

	def crear
		#comprobar si el ya existe ese idusuario con ese idobjetivo. ESTO SE DEBE PASAR AL MODELO!
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
			respond_to.html{render :queonda, notice: 'El registro está duplicado'}	
    	end
	end

	def crearauto
		#comprobar si el ya existe ese idusuario con ese idobjetivo. ESTO SE DEBE PASAR AL MODELO!
		
		@verificador = Estrella.find_by(idusuario_id: params[:idusuario_id], idobjetivo_id: params[:idobjetivo_id])

		if @verificador == nil

				#Puede crear un PROFESOR
		 		@estrella = Estrella.new(autostar_params)

		 	
		 		respond_to do |format|
				    if @estrella.save
				        format.html { redirect_to misions_path, notice: 'Se dio una estrella correctamente' } #Redireccionar al objetivo
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
		@estrella= Estrella.find_by(id: params[:id])
		@estrella.est1 = params[:est1]
		@estrella.est2 = params[:est2]
		@estrella.est3 = params[:est3]
		#Las puede dar un usuario con privilegios de PROFESOR
		respond_to do |format|
				    if @estrella.save
				        format.html { redirect_to veruser_path(idusuario: params[:idusuario_id]), notice: 'Se dio una estrella correctamente'} #Redireccionar al objetivo
				    else
				        format.html { redirect_to usuarios_path, notice: 'Hubo un error' } #Redireccionar a página de error
				    end
			    end
	end
	

	private
    def validarusuario
      unless usuario_signed_in?
        redirect_to new_usuario_session_path, notice: "Hay que iniciar sesión para acceder a esta sección."
      end
    end 
    def validaradmin
      unless current_usuario.es_admin?
      	redirect_to misions_path, notice: "No disponés de permisos suficientes para acceder a esta sección."
      end
    end
		def star_params
			params.require(:estrella).permit(:idusuario_id, :idobjetivo_id, :est1, :est2, :est3)
		end
			def autostar_params
			{"idusuario_id"=>current_usuario.id, "idobjetivo_id" => params[:idobjetivo_id],"est1"=> true, "est2"=> false, "est3"=> false}
		end
end
