module Api::V1
  class LensController < ApplicationController
    before_action :set_len, only: [:show, :update, :destroy]
    before_action :admins!, only: [:create, :update, :destroy]

    # GET /lens
    def index
      @lens = Len.all

      render json: @lens.to_json(:methods => [:image_thumb, :image_small, :image_medium])
    end

    # GET /lens/1
    def show
      render json: @len.to_json(:methods => [:image_thumb, :image_small, :image_medium])
    end

    # POST /lens
    def create
      @len = Len.new(len_params)
      @len.users_id = current_user.id
      if @len.save
        render json: @len.to_json(:methods => [:image_thumb, :image_small, :image_medium]), status: :created
      else
        render json: @len.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /lens/1
    def update
      if @len.update(len_params)
        render json: @len
      else
        render json: @len.errors, status: :unprocessable_entity
      end
    end

    # DELETE /lens/1
    def destroy
      @len.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_len
        @len = Len.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def len_params
        params.permit(:title, :image, :caption,)
      end
  end
end
