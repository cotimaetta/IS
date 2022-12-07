class AgregarCargaTarjeta < ActiveRecord::Migration[7.0]
  def change
    add_column :tarjeta, :carga, :float
  end
end
