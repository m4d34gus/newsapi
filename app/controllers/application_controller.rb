class ApplicationController < ActionController::API
	include ActionController::Serialization
	before_action :authenticate_request
	before_filter :current_user


	include Authenticable


	private
	attr_reader :current_user
	def authenticate_request
		#logger.debug request.headers.each(|name, value|)
		Rails.logger.info(request.env)

		@current_user = AuthorizeApiRequest.call(request.headers).result
		render json: {error: 'Not Authorized'}, status: 401 unless @current_user
	end
end
