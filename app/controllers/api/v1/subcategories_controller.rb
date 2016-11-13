module Api::V1
  class SubcategoriesController < ApplicationController
    before_action :set_subcategory, only: [:show, :update, :destroy]

    # GET /subcategories
    def index
      if params[:category_id]
        category = Category.find(params[:category_id])

        @subcategories = Subcategory.where(categories_id: category.id)
      else
        @subcategories = Subcategory.all
      end


      render json: @subcategories.to_json(:methods => [:idstring])
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
