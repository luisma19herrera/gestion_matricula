class Documento < ActiveRecord::Base
	belongs_to :estudiante
	has_attached_file :adjunto
    validates_attachment_content_type :adjunto, :content_type => ['image/jpeg', 'image/png', 'application/pdf']
end
