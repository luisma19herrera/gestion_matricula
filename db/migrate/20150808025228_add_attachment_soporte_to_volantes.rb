class AddAttachmentSoporteToVolantes < ActiveRecord::Migration
  def self.up
    add_column :volantes, :soporte_file_name, :string
    add_column :volantes, :soporte_content_type, :string
    add_column :volantes, :soporte_file_size, :integer
    add_column :volantes, :soporte_updated_at, :datetime
  end
  def self.down
    remove_column :volantes, :soporte_file_name
    remove_column :volantes, :soporte_content_type
    remove_column :volantes, :soporte_file_size
    remove_column :volantes, :soporte_updated_at
  end
end