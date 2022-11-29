class Reporte < ApplicationRecord
  belongs_to :auto
  belongs_to :super, class_name: 'User'
  belongs_to :user, class_name: 'User'

end
