class TablerosController < ApplicationController
  before_action :set_tablero, only: [:show, :edit, :update, :destroy]

  # GET /tableros
  # GET /tableros.json
  def index
    @tableros = Tablero.all
  end

  # GET /tableros/1
  # GET /tableros/1.json
  def show
  end

  # GET /tableros/new
  def new
    @tablero = Tablero.new
  end

  # GET /tableros/1/edit
  def edit
  end

  # POST /tableros
  # POST /tableros.json
  def create
    @tablero = Tablero.new(tablero_params)
    m= params.require(:tablero).permit(:idusuario, :grupo, :descripcion, :e1, :e2, :e3, :puntaje)

    params[idusuario.each] do |i|
      miembros=[params[:idusuario[i]]:grupo[i], :descripcion[i], :e1[i], :e2[i], :e3[i], :puntaje[i]]
    end

    respond_to do |format|
      if @tablero.save
        format.html { redirect_to @tablero, notice: "El tablero se creó correctamente" }
        format.json { render :show, status: :created, location: @tablero }
      else
        format.html { render :new }
        format.json { render json: @tablero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tableros/1
  # PATCH/PUT /tableros/1.json
  def update
    respond_to do |format|
      if @tablero.update(tablero_params)
        format.html { redirect_to @tablero, notice: 'Tablero was successfully updated.' }
        format.json { render :show, status: :ok, location: @tablero }
      else
        format.html { render :edit }
        format.json { render json: @tablero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tableros/1
  # DELETE /tableros/1.json
  def destroy
    @tablero.destroy
    respond_to do |format|
      format.html { redirect_to tableros_url, notice: 'Tablero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tablero
      @tablero = Tablero.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tablero_params
      params.require(:tablero).permit(:nombre, :descripcion, :horainicio, :horafin, :puntos, :abierto, :e1, :e2, :e3, :cronometro)
 
    end
end
