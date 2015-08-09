class CreateVolantes < ActiveRecord::Migration
  def change
    create_table :volantes do |t|
      t.string :concepto
      t.integer :valor
      t.date :f_generacion
      t.date :f_ingreso
      t.string :numero_comprobante
      t.integer :estudiante_id

      t.timestamps null: false
    end
  end
end
