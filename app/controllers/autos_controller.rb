class AutosController < ApplicationController
  def new
    @auto = Auto.new
  end 

  def initialize 
    @cantidad = 0 
  end

  def mientrasalquiler
    @auto = Auto.find(params[:id])
    @historial = HistorialUso.where(auto_id: @auto.id).last
    @hora = @historial.fechaInicio + @historial.cantHoras.hours + @historial.horasExtra.hours
    @horasRestantes = ((@hora - DateTime.now)/1.hour).round(0)
    reporte = Reporte.where(auto_id: @auto.id).last
    @reporto = reporte != nil && reporte.fecha > @historial.fechaInicio
  end

  def dejar
    @auto = Auto.find(params[:id_auto])
    @historial = HistorialUso.where(auto_id: @auto.id).last
  end

  def verificarDejar
    @auto = Auto.find(params[:auto][:id])
    @auto.update(auto_params)
    @auto.update(desbloqueado: false)
    @auto.alquilado = false
    @auto.save
    @user = User.find(current_user.id)
    if(@user.nombre == "Valentina")
      @auto.location_point_x = -34.92089463861315
      @auto.location_point_y = -57.95628985496138
      @auto.save
    end

    if(@user.nombre == "Carolina")
      @auto.location_point_x = -34.86247155936304
      @auto.location_point_y = -57.901935717209724
      @auto.save
    end

    if(@auto.fueraDelCasco?)  
      @historial = HistorialUso.where(auto_id: @auto.id).last
      #ver si el user se paso
      if(DateTime.now > @historial.fechaInicio+@historial.cantHoras.hours+@historial.horasExtra.hours)
        @tiempo = @historial.fechaInicio + @historial.cantHoras.hours + @historial.horasExtra.hours
        @tiempoRestante = (Integer((@tiempo - DateTime.now)/15.minutes))*1000
        @user.saldo = @user.saldo + @tiempoRestante
        @user.save
      end
      HistorialUso.last.update(fechaFinal: DateTime.now)
      redirect_to historial_uso_path(:id => @historial.id)
    else
      redirect_to root_path,alert:"Su multa sera atendida por un supervisor"
    end
  end
  
  #SE ACTUALIZA CON EL SUBMIT - OJO!!!!!!!!!!!!!
  def update
    @auto = Auto.find(params[:id])
    @auto.update(auto_params)
 end

 def alquilar 
    @auto = Auto.find(params[:id])
    @user = User.find(params[:id_user])
    if @auto.alquilado == true
      # el auto fue alquilado por otro
      redirect_to autos_path, alert: "El auto fue alquilado por otra persona"
    else
      if Date.today > @user.fecha_ven
        #el carnet esta mal
        redirect_to root_path, alert: "Tu carnet esta vencido"        
      else
        #todo bien
        @auto.update(alquilado: true)
        redirect_to new_historial_uso_path(:id_auto => @auto.id)
      end
    end
  end 
  
  
  
  def desbloquear 
    @auto = Auto.find(params[:id])
    @auto.update(desbloqueado: true)
    redirect_to autos_mientrasalquiler_path(:id => @auto.id), alert: "auto desbloqueado" 
  end 

  def mostrardocumentacion
    @auto = Auto.find(params[:id])
  end 
  
  def index
    @autos = Auto.all
    @auto = Auto.last
    @cant = Auto.where(en_servicio: true, alquilado: false).count 
  end

  def show
    @auto = Auto.find(params[:id])
  end

  def create
    @auto = Auto.new(auto_params)
    if @auto.save
      redirect_to @auto
    else
      render :new, status: :see_other
    end
  end

  
  private

  def auto_params
    params.require(:auto).permit(:patente, :modelo, :marca, :descripcion, :cant_puertas, :cant_combustible, :location_point_x, :location_point_y, :foto, :fotodocumentacion)
  end

end
