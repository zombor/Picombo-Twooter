module Picombo
	module Models
		class User
			include DataMapper::Resource
			storage_names[:default] = 'users'

			property :id,		Serial
			property :username,	String, :unique => :u1
			property :password,	String
			property :email,	String

			has n, :twoots, :model => 'Picombo::Models::Twoot'

			def self.name_field
				:username
			end

			def password=(new_password)
				attribute_set(:password, Picombo::Auth.hash_password(new_password))
			end
		end
	end
end