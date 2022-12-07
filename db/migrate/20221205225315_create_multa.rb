class CreateMulta < ActiveRecord::Migration[7.0]
  def change
    create_table :multa do |t|
      t.text :descripcion
      t.date :fecha
      t.references :super, null: false, foreign_key: { to_table: :users }
      t.references :HistorialUso, null: false, foreign_key: true
      t.float :monto

      t.timestamps
    end
  end
end
