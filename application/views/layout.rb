module Picombo
	module Stache
		class Layout < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'layout', true, 'mustache').shift).read

			def base_url
				Picombo::Url.base
			end

			def logged_in?
				Picombo::Auth.logged_in?
			end
		end
	end
end