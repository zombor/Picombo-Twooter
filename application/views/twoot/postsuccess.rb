module Picombo
	module Stache
		class Twoot_PostSuccess < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'twoot/postsuccess', true, 'mustache').shift).read
		end
	end
end