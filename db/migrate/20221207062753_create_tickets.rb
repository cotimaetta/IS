class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :descripcion
      t.references :user, null: false, foreign_key: true
      t.references :historial_uso, null: false, foreign_key: true
      t.float :monto

      t.timestamps
    end
  end
end
