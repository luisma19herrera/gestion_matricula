json.array!(@volantes) do |volante|
  json.extract! volante, :id, :concepto, :valor, :f_generacion, :f_ingreso, :numero_comprobante, :estudiante_id
  json.url volante_url(volante, format: :json)
end
