module Picombo
	module Models
		class Twoot
			include DataMapper::Resource
			storage_names[:default] = 'twoots'

			property :id,      Serial
			property :body,    String
			property :date,    String
			property :user_id, Integer

			belongs_to :user, :model => 'Picombo::Models::User'
		end
	end
end