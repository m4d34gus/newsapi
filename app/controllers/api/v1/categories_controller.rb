module Api::V1
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]
    before_action :admins!, only: [:create, :update, :destroy]

    # GET /categories
    def index
      @categories = Category.all

      render json: @categories.to_json(:include => :users)
    end

    # GET /categories/1
    def show
      render json: @category
    end

    # POST /categories
    def create
      @category = Category.new(category_params)
      @category.users_id = current_user.id

      if @category.save
        render json: @category.to_json(:include => :users) , status: :created, location: [:v1, @category]
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name)
      end
  end
end
