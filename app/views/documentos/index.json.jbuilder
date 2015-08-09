json.array!(@documentos) do |documento|
  json.extract! documento, :id, :tipo_documento, :fecha_ingreso, :observacion, :estudiante_id
  json.url documento_url(documento, format: :json)
end
