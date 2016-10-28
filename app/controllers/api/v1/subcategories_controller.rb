module Api::V1
  class SubcategoriesController < ApplicationController
    before_action :set_subcategory, only: [:show, :update, :destroy]

    # GET /subcategories
    def index
      @subcategories = Subcategory.all

      render json: @subcategories
    end

    # GET /subcategories/1
    def show
      render json: @subcategories
    end



    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subcategory
        @subcategories = Subcategory.where(categories_id: params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def subcategory_params
        params.permit(:name, :users_id, :categories_id)
      end
  end
end
