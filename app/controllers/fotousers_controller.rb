class FotousersController < ApplicationController
  def new
    @fotouser = Fotouser.new
  end

  def index
    @fotousers = Fotouser.all
  end

  def show
    @fotouser = Fotouser.find(params[:id])
    @user = User.find(@fotouser.id_user)
  end

  def edit
    @user = User.find(params[:id])
    @fotouser = Fotouser.where(id_user: params[:id]).last
    @user.validacion = 2
    @user.save
  end

  def modificar
    @foto = Fotouser.where(id_user: fotouser_params[:id_user]).last
    @user = User.find(fotouser_params[:id_user])
    if @foto.update(fotouser_params)
      redirect_to edit_user_registration_path(@user)
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def editdos
    @user = User.find(params[:id])
    @fotouser = Fotouser.where(id_user: params[:id]).last
    @user.validacion = 2
    @user.save
  end

  def modificardos
    @foto = Fotouser.where(id_user: fotouser_params[:id_user]).last
    @user = User.find(fotouser_params[:id_user])
    if @foto.update(fotouser_params)
      redirect_to root_path
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def create
    @fotouser = Fotouser.new(fotouser_params)
    if @fotouser.save
      redirect_to @fotouser
    else
      render :new, status: :see_other
    end
  end
  private

  def fotouser_params
    params.require(:fotouser).permit(:id_user, :fotoDNI, :fotoCarnet)
  end
end
