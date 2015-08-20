ActiveAdmin.register Estudiante do

permit_params :estado


form do |f|
  f.inputs do
    f.input :estado, :label => 'Estado', :as => :select, :collection => [["Aspirante", "Aspirante"],["Pre Inscrito", "Pre Inscrito"],["Inscrito", "Inscrito"], ["Admitido", "Admitido"], ["Matricula en Proceso", "Matricula en Proceso"],["Matriculado", "Matriculado"],["No Admitido", "No Admitido"]]
    
    
  end
   f.actions
end




end
