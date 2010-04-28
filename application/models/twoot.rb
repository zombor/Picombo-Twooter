module Picombo
	module Models
		class Twoot < Picombo::Model
			storage_names[:default] = 'twoots'

			property :id,      Serial
			property :body,    String
			property :date,    String

			belongs_to :user, :model => 'Picombo::Models::User'
		end
	end
end