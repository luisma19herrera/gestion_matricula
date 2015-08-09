class Volante < ActiveRecord::Base
	belongs_to :estudiante
	has_attached_file :soporte
    validates_attachment_content_type :soporte, :content_type => ['image/jpeg', 'image/png', 'application/pdf']
end
