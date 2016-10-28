class AuthenticateUser
	prepend SimpleCommand

	def initialize(email, password)
		@email = email
		@password = password
	end

	def call
		if user
			@data = {auth_token: JsonWebToken.encode(user_id: user.id), role: user.role, email: user.email, name: user.name}
		end
	end

	private
	attr_accessor :email, :password

	def user
		user = User.find_by(email: email)
		return user if user && user.authenticate(password)

		errors.add :user_authentication, 'invalid credentials.'
		nil
	end
end