class ObjetivosController < ApplicationController
  before_action :set_objetivo, only: [:show, :edit, :update, :destroy]
  before_action :set_mision  # GET /objetivos
  before_action :validarusuario

  # GET /objetivos.json
  def index
    @objetivos = Objetivo.all
  end

  # GET /objetivos/1
  # GET /objetivos/1.json
  def show
    #@estrellas = Estrella.select("idobjetivo_id", "idusuario_id", "est1", "est2", "est3").where
    @estrella = Estrella.find_by(idusuario_id: current_usuario.id, idobjetivo_id: params[:id])
    
    if @estrella == nil
      @noexiste = true
    else
      @noexiste = false
    end
  end

  # GET /objetivos/new
  def new
    @objetivo = Objetivo.new
  end

  # GET /objetivos/1/edit
  def edit
  end

  # POST /objetivos
  # POST /objetivos.json
  def create
    @objetivo = Objetivo.new(objetivo_params)
    @objetivo.mision= @mision

    respond_to do |format|
      if @objetivo.save
        format.html { redirect_to [@mision, @objetivo], notice: 'Objetivo was successfully created.' }
        format.json { render :show, status: :created, location: [@mision, @objetivo] }
      else
        format.html { render :new }
        format.json { render json: [@mision, @objetivo].errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivos/1
  # PATCH/PUT /objetivos/1.json
  def update
    respond_to do |format|
      if @objetivo.update(objetivo_params)
        format.html { redirect_to [@mision, @objetivo], notice: 'Objetivo was successfully updated.' }
        format.json { render :show, status: :ok, location: [@mision, @objetivo] }
      else
        format.html { render :edit }
        format.json { render json: [@mision, @objetivo].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivos/1
  # DELETE /objetivos/1.json
  def destroy
    @objetivo.destroy
    respond_to do |format|
      format.html { redirect_to mision_objetivos_url, notice: 'Objetivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mision
    @mision = Mision.find(params[:mision_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo
      @objetivo = Objetivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_params
      params.require(:objetivo).permit(:mision_id, :nombre, :descripcion, :urlvideo, :instructivo, :urlevaluativo)
    end
    def mision_params
      params.require(:mision).permit(:id, :nombre)
    end
    def validarusuario
      unless usuario_signed_in?
        redirect_to new_usuario_session_path, notice: "Hay que iniciar sesión para acceder a esta sección."
      end
    end 
end
