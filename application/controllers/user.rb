module Picombo
	module Controllers
		class User < Picombo::Controllers::Template
			def initialize
				super
			end

			def index
				@template[:body] = Picombo::Stache::User_Login.new.render
			end

			def create
				if Picombo::Input.instance.post.length > 0

					user = Picombo::Models::User.new
					user.username = Picombo::Input.instance.post('username')
					user.email = Picombo::Input.instance.post('email')
					user.password = Picombo::Input.instance.post('password')
					user.save

					body = Picombo::Stache::User_CreateSuccess.new

					Picombo::Auth.instance.login(user.username, Picombo::Input.instance.post('password'))
				else
					body = Picombo::Stache::User_Create.new
				end
				@template[:body] = body.render
			end

			def login
				if Picombo::Input.instance.post.length > 0
					if Picombo::Auth.instance.login(Picombo::Input.instance.post('username'), Picombo::Input.instance.post('password'))
						body = 'You have logged in!'
					else
						body = 'Invalid password or unknown username'
					end
				else
					body = Picombo::Stache::User_Login.new.render
				end
				@template[:body] = body
			end
		end
	end
end