class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :tipo_documento
      t.date :fecha_ingreso
      t.text :observacion
      t.integer :estudiante_id

      t.timestamps null: false
    end
  end
end
