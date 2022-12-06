class CreateTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :tarjeta do |t|
      t.integer :numero
      t.date :fecha_ven
      t.string :nombre_titular
      t.integer :contras
      t.float :monto
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
