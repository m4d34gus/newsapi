module Api::V1   
	class AuthenticationsController < ApplicationController
	  skip_before_action :authenticate_request

	  def authenticate
	  	command = AuthenticateUser.call(params[:email],params[:password])

	  	if command.success?
	  		render json: {auth_token: command.result}, status: 201
	  	else
	  		render json: {errors: command.errors}, status: :unauthorized
	  	end
	  end
	end
end
