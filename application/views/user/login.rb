module Picombo
	module Stache
		class User_Login < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'user/login', true, 'mustache').shift).read
		end
	end
end