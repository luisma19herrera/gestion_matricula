class AddArchivoToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :archivo, :string
  end
end
