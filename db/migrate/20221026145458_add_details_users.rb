class AddDetailsUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :dni, :integer

    add_column :users, :fecha_nac, :date
    add_column :users, :fecha_ven, :date

    add_column :users, :saldo, :float

    add_column :users, :rol, :integer

    add_column :users, :validacion, :boolean

    add_column :users, :pos, :point

  end
end
