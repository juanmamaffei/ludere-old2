class UsuariosController < ApplicationController
  before_action :validarusuario
  before_action :validaradmin


  def index
  	@usuarios = usuarios_todos
  end

  def mostrar
	@estrellas = estrellas_parametros
	@usuario = unicousuario
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
    def usuarios_todos
    	Usuario.all
    end
    def unicousuario
    	Usuario.find(params[:idusuario])
    end
    def estrellas_parametros
    	Estrella.select("id", "idobjetivo_id", "idusuario_id", "est1", "est2", "est3").where(idusuario_id: params[:idusuario])
    end
end




 