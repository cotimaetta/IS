class Cambiartipostarjeta < ActiveRecord::Migration[7.0]
  def change
    remove_column :tarjeta, :fecha_ven
    add_column :tarjeta, :mes_ven, :string
    add_column :tarjeta, :anio_ven, :string
    change_column :tarjeta, :numero , :string
  end
end
