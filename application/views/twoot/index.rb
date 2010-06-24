module Picombo
	module Stache
		class Twoot_Index < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'twoot/index', true, 'mustache').shift).read

			def twoots
				twoots = []

				Picombo::Models::Twoot.all.each do |twoot|
					twoots << {
						:username => twoot.user.username,
						:date     => twoot.date,
						:body     => twoot.body
					}
				end

				twoots
			end
		end
	end
end