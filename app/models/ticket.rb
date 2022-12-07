class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :historial_uso
end
