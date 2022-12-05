class CreateReportes < ActiveRecord::Migration[7.0]
  def change
    create_table :reportes do |t|
      t.text :descripcion
      t.datetime :fecha
      t.references :auto, null: false, foreign_key: true
      #t.references :super, null: false, foreign_key: { to_table: :users }
      t.references :user, null: false, foreign_key: true
      t.integer :tipo

      t.timestamps
    end
  end
end
