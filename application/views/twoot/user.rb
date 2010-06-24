module Picombo
	module Stache
		class Twoot_User < Mustache
			self.template = File.open(Picombo::Core.find_file('views', 'twoot/index', true, 'mustache').shift).read

			@user_id = nil

			def initialize(user_id)
				@user_id = user_id
			end

			def twoots
				twoots = []

				Picombo::Models::Twoot.all(:user_id => @user_id).each do |twoot|
					twoots << {
						:id       => @user_id,
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