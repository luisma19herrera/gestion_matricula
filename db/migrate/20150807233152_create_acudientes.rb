class CreateAcudientes < ActiveRecord::Migration
  def change
    create_table :acudientes do |t|
      t.string :nombre
      t.string :apellidos
      t.string :identificacion
      t.string :ocupacion
      t.string :cargo
      t.string :empresa
      t.string :direccion
      t.string :telefono
      t.string :celular

      t.timestamps null: false
    end
  end
end
