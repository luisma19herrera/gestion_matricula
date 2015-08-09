json.array!(@acudientes) do |acudiente|
  json.extract! acudiente, :id, :nombre, :apellidos, :identificacion, :ocupacion, :cargo, :empresa, :direccion, :telefono, :celular
  json.url acudiente_url(acudiente, format: :json)
end
