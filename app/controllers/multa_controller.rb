class MultaController < ApplicationController
  before_action :set_multum, only: %i[ show edit update destroy ]

  # GET /multa or /multa.json
  def index
    @multa = Multum.all
  end

  # GET /multa/1 or /multa/1.json
  def show
  end

  # GET /multa/new
  def new
    @multum = Multum.new
  end

  # GET /multa/1/edit
  def edit
  end

  # POST /multa or /multa.json
  def create
    @multum = Multum.new(multum_params)
    
    h = HistorialUso.where(user_id: @multum.user_id).where(user_auto: @multum.auto_id)
    
    respond_to do |format|
      if (@multum.save && h != nil)
        format.html { redirect_to multum_url(@multum), notice: "Multum was successfully created." }
        format.json { render :show, status: :created, location: @multum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multa/1 or /multa/1.json
  def update
    respond_to do |format|
      if @multum.update(multum_params)
        format.html { redirect_to multum_url(@multum), notice: "Multum was successfully updated." }
        format.json { render :show, status: :ok, location: @multum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multa/1 or /multa/1.json
  def destroy
    @multum.destroy

    respond_to do |format|
      format.html { redirect_to multa_url, notice: "Multum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def multar
    @multum = Multum.new
    @multum.HistorialUso_id = params[:HU_id]
    @multum.super_id = params[:super_id]
    @multum.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multum
      @multum = Multum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multum_params
      params.require(:multum).permit(:descripcion, :fecha, :super_id, :HistorialUso_id, :monto)
    end
end
