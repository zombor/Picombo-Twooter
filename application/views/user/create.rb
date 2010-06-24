module Picombo
	module Stache
		class User_Create < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'user/create', true, 'mustache').shift).read
		end
	end
end