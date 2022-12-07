class Borrarcontras < ActiveRecord::Migration[7.0]
  def change
    remove_column :tarjeta, :contras
    add_column :tarjeta, :codigo_seguridad, :string
  end
end
