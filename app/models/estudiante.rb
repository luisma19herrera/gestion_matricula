class Estudiante < ActiveRecord::Base
	belongs_to :acudiente
	has_many :documentos
	has_many :volantes
end
