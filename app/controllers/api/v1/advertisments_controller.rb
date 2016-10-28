module Api::V1 
  class AdvertismentsController < ApplicationController
    before_action :set_advertisment, only: [:show, :update, :destroy]
    before_action :admins!, only: [:create, :update, :destroy]

    # GET /advertisments
    def index
      @advertisments = Advertisment.all

      render json: @advertisments.to_json(:include => :users)
    end

    # GET /advertisments/1
    def show
      render json: @advertisment
    end

    # POST /advertisments
    def create
      @advertisment = Advertisment.new(advertisment_params)
      @advertisment.users_id = current_user.id
      if @advertisment.save
        render json: @advertisment.to_json(:include => :users), status: :created, location: [:v1, @advertisment]
      else
        render json: @advertisment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /advertisments/1
    def update
      if @advertisment.update(advertisment_params)
        render json: @advertisment
      else
        render json: @advertisment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /advertisments/1
    def destroy
      @advertisment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_advertisment
        @advertisment = Advertisment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def advertisment_params
        params.require(:advertisment).permit(:title, :content)
      end
  end
end
