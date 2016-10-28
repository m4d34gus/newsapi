module Api::V1   
	class AuthenticationsController < ApplicationController
	  skip_before_action :authenticate_request

	  def authenticate

	  	command = AuthenticateUser.call(params[:email],params[:password])

	  	if command.success?
				credential = command.result
				render json: {auth_token: credential[:auth_token], role: credential[:role],email: credential[:email],name: credential[:name], success: 1}, status: 201
	  	else
	  		render json: {errors: command.errors}, status: :unauthorized
	  	end
	  end
	end
end
