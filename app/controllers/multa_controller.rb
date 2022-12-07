class MultaController < ApplicationController
  before_action :set_multum, only: %i[ show edit update destroy ]

  # GET /multa or /multa.json
  def index
    @multa = Multa.all
  end

  # GET /multa/1 or /multa/1.json
  def show
  end

  def multar
    @multa = Multa.new
  end

  # GET /multa/new
  def new
    @multum = Multa.new
  end

  # GET /multa/1/edit
  def edit
  end

  # POST /multa or /multa.json
  def create
    @multum = Multa.new(multum_params)

    respond_to do |format|
      if @multum.save
        format.html { redirect_to multum_url(@multum), notice: "Multa was successfully created." }
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
        format.html { redirect_to multum_url(@multum), notice: "Multa was successfully updated." }
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
      format.html { redirect_to multa_index_url, notice: "Multa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multum
      @multum = Multa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multum_params
      params.require(:multum).permit(:descripcion, :user_id, :historialuso, :references, :monto)
    end
end
