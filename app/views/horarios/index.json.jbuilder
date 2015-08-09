json.array!(@horarios) do |horario|
  json.extract! horario, :id, :fecha, :hora_inicio, :hora_fin, :tipo_tramite
  json.url horario_url(horario, format: :json)
end
