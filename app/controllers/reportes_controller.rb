class ReportesController < ApplicationController
  before_action :set_reporte, only: %i[ show edit update destroy ]

  # GET /reportes or /reportes.json
  def index
    @reportes = Reporte.all
  end

  # GET /reportes/1 or /reportes/1.json
  def show
  end

  # GET /reportes/new
  def new
    @reporte = Reporte.new
  end

  # GET /reportes/1/edit
  def edit
  end

  # POST /reportes or /reportes.json
  def create
    @reporte = Reporte.new(reporte_params)
    @reporte.user_id = current_user.id
    @reporte.auto_id = HistorialUso.where(user_id: @reporte.user_id).last.auto_id
    @reporte.fecha = DateTime.now

    respond_to do |format|
      if @reporte.save
        format.html { redirect_to autos_mientrasalquiler_path(:id => @reporte.auto_id), notice: "Reporte was successfully created." }
        format.json { render :show, status: :created, location: @reporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  def generarpre
    @reporte = Reporte.new(reporte_params)
    @reporte.user_id = params[:id]
    @reporte.auto_id = HistorialUso.where(user_id: @reporte.user_id).last.auto_id
    @reporte.fecha = DateTime.now

    respond_to do |format|
      if @reporte.save
        format.html { redirect_to autos_mientrasalquiler_path(:id => @reporte.auto_id), notice: "Reporte was successfully created." }
        format.json { render :show, status: :created, location: @reporte }
      else
        format.html { render :pre, status: :unprocessable_entity }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end


  def pre
    @reporte = Reporte.new()
    @reporte.auto_id = HistorialUso.where(user_id: @reporte.user_id).last
  end
 
  # PATCH/PUT /reportes/1 or /reportes/1.json
  def update
    respond_to do |format|
      if @reporte.update(reporte_params)
        format.html { redirect_to reporte_url(@reporte), notice: "Reporte was successfully updated." }
        format.json { render :show, status: :ok, location: @reporte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1 or /reportes/1.json
  def destroy
    @reporte.destroy

    respond_to do |format|
      format.html { redirect_to reportes_url, notice: "Reporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte
      @reporte = Reporte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reporte_params
      params.require(:reporte).permit(:descripcion, :foto, :fecha, :auto_id, :tipo)
    end
end
