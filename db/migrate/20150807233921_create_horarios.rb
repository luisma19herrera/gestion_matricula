class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.string :tipo_tramite

      t.timestamps null: false
    end
  end
end
