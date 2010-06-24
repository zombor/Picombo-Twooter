module Picombo
	module Stache
		class User_CreateSuccess < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'user/createsuccess', true, 'mustache').shift).read
		end
	end
end