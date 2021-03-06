class MisionsController < ApplicationController
  before_action :set_mision, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :validarusuario
  before_action :validaradmin, except: [:show, :index, :upvote, :downvote, :mismisiones]


  # GET /misions
  # GET /misions.json
  def index
      @misions = Mision.all

  end

  def mismisiones
      #misiones que sólo coincidan con el voter_id del current_usuario
      @misions = current_usuario.find_liked_items

  end
  # GET /misions/1
  # GET /misions/1.json
 def show
     @objetivos = Objetivo.select("id", "nombre","descripcion").where(:mision_id => params[:id])
     @estrellas = Estrella.select("idobjetivo_id", "idusuario_id", "est1", "est2", "est3").where(idusuario_id: current_usuario.id)
     #Para optimizar se deberá agregar un campo de idmision y requerirlo en la misma consulta de la línea anterior, para disminuir el tamaño del array
  end

  # GET /misions/new
  def new
    @mision = Mision.new
  end

  # GET /misions/1/edit
  def edit
  end

  def upvote
    @mision.upvote_by current_usuario
    redirect_to :back
  end

  def downvote
    @mision.downvote_by current_usuario
    redirect_to :back
  end

 
  # POST /misions
  # POST /misions.json
  def create
    @mision = Mision.new(mision_params)

    respond_to do |format|
      if @mision.save
        format.html { redirect_to @mision, notice: 'La misión se creó correctamente.' }
        format.json { render :show, status: :created, location: @mision }
      else
        format.html { render :new }
        format.json { render json: @mision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /misions/1
  # PATCH/PUT /misions/1.json
  def update
    respond_to do |format|
      if @mision.update(mision_params)
        format.html { redirect_to @mision, notice: 'La misión se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @mision }
      else
        format.html { render :edit }
        format.json { render json: @mision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /misions/1
  # DELETE /misions/1.json
  def destroy
    @mision.destroy
    respond_to do |format|
      format.html { redirect_to misions_url, notice: 'La misión se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mision
      @mision = Mision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mision_params
      params.require(:mision).permit(:nombre, :nivel, :descripcion, :urltemario, :urlimagen, :comentario, :habilitado, :visible, :image)
    end
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
end
