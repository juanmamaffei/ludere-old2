class GruposController < ApplicationController
  before_action :set_grupo, only: [:show, :edit, :update, :destroy]

  before_action :validarusuario
 
  



  # GET /grupos
  # GET /grupos.json
  def index
    @grupos = Grupo.all
    #Requerir id y nombre de usuarios, id y nombre de misiones

    #condición para mostrar: que el usuario pertenezca al grupo


  end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
    set_grupo
    ext_params

      @eslider = false;
      @administradores.each do |a|
        if current_usuario.id == a.id
          @eslider=true;
        end
      end
    #requerir usuarios integrantes (su id, nombre, imagen)

    #requerir posts del grupo
    @post = Post.new
    #requerir misiones del grupo
  end

  # GET /grupos/new
  def new
    @grupo = Grupo.new
    #requerir usuarios
  end

  # GET /grupos/1/edit
  def edit
    #permitir sólo para líderes de grupo
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(grupo_params)

    respond_to do |format|
      if @grupo.save
        format.html { redirect_to @grupo, notice: 'Grupo was successfully created.' }
        format.json { render :show, status: :created, location: @grupo }
      else
        format.html { render :new }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to @grupo, notice: 'Grupo was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  def agregarusuario
    #En @grupo se encuentran los datos del grupo seleccionado.
    @grupo = Grupo.find_by(id: params[:id])


    #Se obtiene el array de integrantes y se incluye el id del usuario al final del mismo
    @grupo.integrantes << current_usuario.id


    #A menos que el grupo sea abierto, se incluirá el id del usuario a la lista de revisión (para que luego sea aceptado por el ĺíder)
    unless @grupo.abierto?
      @grupo.revision << current_usuario.id
    end



    respond_to do |format|
            if @grupo.save
                format.html { redirect_to grupo_path(id: params[:id]), notice: 'Ahora participás del grupo'} #Redireccionar al objetivo
            else
                format.html { redirect_to grupos_path, notice: 'Hubo un error' } #Redireccionar a página de error
            end
          end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo.destroy
    respond_to do |format|
      format.html { redirect_to grupos_url, notice: 'Grupo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    def ext_params
      @misiones = Mision.where(id: @grupo.misiones)
      @integrantes = Usuario.where(id: @grupo.integrantes)
      @administradores = Usuario.where(id: @grupo.administradores)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_params
      params.require(:grupo).permit(:nombre, :descripcion, :integrantes, :misiones, :administradores, :abierto, :image, :revision)
    end
     def validarusuario
      unless usuario_signed_in?
        redirect_to new_usuario_session_path, notice: "Hay que iniciar sesión para acceder a esta sección."
      end
    end 

end
