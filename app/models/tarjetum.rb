class Tarjetum < ApplicationRecord
  belongs_to :user

  validates :nombre_titular, :numero, :fecha_ven, :contras , presence:true
  validates :numero, length: { is: 16 }
  validates :contras, numericality: { only_integer: true },  length: { is: 3 }
  validate :vencimiento


  def vencimiento
      if fecha_ven != nil
        if Date.today > fecha_ven
          errors.add(:base ,message:"No podes tener la tarjeta vencida")
        end
      end
  end
end
