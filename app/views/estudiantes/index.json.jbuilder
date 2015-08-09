json.array!(@estudiantes) do |estudiante|
  json.extract! estudiante, :id, :nombre, :apellidos, :edad, :doc_identidad, :lugar_expedicion, :grado, :f_nacimiento, :institucion_anterior, :grado_aspirado, :estado, :acudiente_id, :f_examen, :f_matricula
  json.url estudiante_url(estudiante, format: :json)
end
