module Picombo
	module Controllers
		class Twoot < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				@template[:body] = Picombo::Stache::Twoot_Index.new.render
			end

			def post
				if ! Picombo::Auth.logged_in?
					@template[:body] = 'You must be logged in to post twoots'
					return
				end

				if Picombo::Input.instance.post.length > 0
					user = Picombo::Session.instance.get('user')

					twoot = Picombo::Models::Twoot.new
					twoot.user_id = user.id
					twoot.body = Picombo::Input.instance.post('body')
					twoot.date = Time.new
					twoot.save

					body = Picombo::Stache::Twoot_PostSuccess.new
				else
					body = Picombo::Stache::Twoot_Post.new
				end

				@template[:body] = body.render
			end

			# lists a user's twoots
			def user(user_id)
				@template[:body] = Picombo::Stache::Twoot_User.new(user_id).render
			end
		end
	end
end