class CreateMulta < ActiveRecord::Migration[7.0]
  def change
    create_table :multa do |t|
      t.text :descripcion
      t.references :user, null: false, foreign_key: true
      t.string :historialuso
      t.string :references
      t.float :monto

      t.timestamps
    end
  end
end
