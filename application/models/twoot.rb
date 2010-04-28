module Picombo
	module Models
		class Twoot < Picombo::Model
			storage_names[:default] = 'twoots'

			property :id,      Serial
			property :user_id, String
			property :body,    String
			property :date,    String
		end
	end
end