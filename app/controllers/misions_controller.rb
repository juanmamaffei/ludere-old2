class MisionsController < ApplicationController
  before_action :set_mision, only: [:show, :edit, :update, :destroy]

  # GET /misions
  # GET /misions.json
  def index
    @misions = Mision.all
  end

  # GET /misions/1
  # GET /misions/1.json
  def show
  end

  # GET /misions/new
  def new
    @mision = Mision.new
  end

  # GET /misions/1/edit
  def edit
  end

  # POST /misions
  # POST /misions.json
  def create
    @mision = Mision.new(mision_params)

    respond_to do |format|
      if @mision.save
        format.html { redirect_to @mision, notice: 'Mision was successfully created.' }
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
        format.html { redirect_to @mision, notice: 'Mision was successfully updated.' }
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
      format.html { redirect_to misions_url, notice: 'Mision was successfully destroyed.' }
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
      params.require(:mision).permit(:nombre, :nivel, :descripcion, :urltemario, :urlimagen, :comentario, :habilitado, :visible)
    end
end
