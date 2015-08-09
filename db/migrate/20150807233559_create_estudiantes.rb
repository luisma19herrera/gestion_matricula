class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :apellidos
      t.integer :edad
      t.string :doc_identidad
      t.string :lugar_expedicion
      t.integer :grado
      t.date :f_nacimiento
      t.string :institucion_anterior
      t.integer :grado_aspirado
      t.string :estado
      t.integer :acudiente_id
      t.date :f_examen
      t.date :f_matricula

      t.timestamps null: false
    end
  end
end
