module Picombo
	module Stache
		class Twoot_Post < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'twoot/post', true, 'mustache').shift).read
		end
	end
end