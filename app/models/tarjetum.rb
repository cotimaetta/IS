class Tarjetum < ApplicationRecord
  belongs_to :user

  validates :nombre_titular, :numero, :mes_ven, :anio_ven, :codigo_seguridad, presence: true
  
  #validate :nombre_titular, format: { with: /([A-Z]\s[A-Z])/gm, message: "solo permite letras mayusculas" }
  #validate :letras
  validate :vencimiento
  validate :nummes
  validate :letras 

  def nummes
    if (mes_ven.to_i > 12 )
      errors.add(:base ,message:"Mes incorrecto")
    end 
  end  

  def letras
    valido = nombre_titular =~ /([A-Z]\s[A-Z])/ 
    if (valido == nil) 
      errors.add(:base ,message:"Nombre titular no es correcto")
    end
  end

  def vencimiento
    a = "20" << anio_ven.to_s
    if (anio_ven != nil) && (a.to_i < Date.today.year.to_i)
      puts a
      errors.add(:base ,message:"No puede asociar tarjeta ya que está vencida")
    else 
      if a == Date.today.year.to_s
        if (mes_ven != nil) && (mes_ven.to_i < Date.today.month.to_i)
          puts a
          errors.add(:base ,message:"No puede asociar tarjeta ya que está vencida")
        end 
      end
    end

  end


  
end
