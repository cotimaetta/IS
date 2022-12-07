class TarjetaController < ApplicationController
  before_action :set_tarjetum, only: %i[ show edit update destroy ]

  # GET /tarjeta or /tarjeta.json
  def index
    @tarjeta = Tarjetum.all
  end

  # GET /tarjeta/1 or /tarjeta/1.json
  def show
  end

  # GET /tarjeta/new
  def new
    @tarjetum = Tarjetum.new
  end

  # GET /tarjeta/1/edit
  def edit
  end

  # POST /tarjeta or /tarjeta.json
  def create
    @tarjetum = Tarjetum.new(tarjetum_params)
    @tarjetum.user_id = current_user.id
    @tarjetum.monto = 20000
    if @tarjetum.numero == '1234222212342222'
      redirect_to new_tarjetum_path,alert:"Tarjeta invalida. Ingrese los datos nuevamente"
    else
      respond_to do |format|
        if @tarjetum.save
          format.html { redirect_to root_path, notice: "Tarjeta asociada con exito" }
          format.json { render :show, status: :created, location: @tarjetum }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tarjetum.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /tarjeta/1 or /tarjeta/1.json
  def update
    respond_to do |format|
      if @tarjetum.update(tarjetum_params)
        @user = User.find(@tarjetum.user_id)
        @user.saldo = @user.saldo + @tarjetum.carga
        @user.save
        @tarjetum.monto = @tarjetum.monto - @tarjetum.carga
        @tarjetum.save
        format.html { redirect_to root_path, notice: "Tarjetum was successfully updated." }
        format.json { render :show, status: :ok, location: @tarjetum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarjetum.errors, status: :unprocessable_entity }
      end
    end
  end

  def cargarSaldo
    @tarjeta = Tarjetum.where(user_id: params[:user_id]).last
    
    redirect_to edit_tarjetum_path(@tarjeta)
  end

  # DELETE /tarjeta/1 or /tarjeta/1.json
  def destroy
    @tarjetum.destroy

    respond_to do |format|
      format.html { redirect_to tarjeta_url, notice: "Tarjetum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarjetum
      @tarjetum = Tarjetum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tarjetum_params
      params.require(:tarjetum).permit(:numero, :carga, :mes_ven, :anio_ven, :nombre_titular, :codigo_seguridad, :monto, :user_id)
    end
end
