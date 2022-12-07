class Tarjetum < ApplicationRecord
  belongs_to :user

  validates :nombre_titular, :numero, :mes_ven, :anio_ven, :codigo_seguridad, presence: true
  
  validate :vencimiento

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
