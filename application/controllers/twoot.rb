module Picombo
	module Controllers
		class Twoot < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				twoots = Picombo::Models::Twoot.all

				body = Picombo::View::Core.new('twoot/index')
				body.set('twoots', twoots)

				@@template.set('body', body.render(true))
			end

			def post
				if ! Picombo::Auth.logged_in?
					@@template.set('body', 'You must be logged in to post twoots')
					return
				end

				if Picombo::Input.instance.post.length > 0
					user = Picombo::Session.instance.get('user')

					twoot = Picombo::Models::Twoot.new
					twoot.user_id = user.id
					twoot.body = Picombo::Input.instance.post('body')
					twoot.date = Time.new
					twoot.save

					body = Picombo::View::Core.new('twoot/post_success')
					body.set('user', user.inspect)
				else
					body = Picombo::View::Core.new('twoot/post')
				end

				@@template.set('body', body.render(true))
			end

			# lists a user's twoots
			def user(user_id)
				twoots = Picombo::Models::Twoot.get(:user_id, user_id)

				body = Picombo::View::Core.new('twoot/index')
				body.set('twoots', twoots)

				@@template.set('body', body.render(true))
			end
		end
	end
end