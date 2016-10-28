module Api::V1   
  class ArticlesController < ApplicationController
    before_action :set_article_by_category, :set_article, only: [:show, :update, :destroy]
    before_action :admins!, only: [:create, :update, :destroy]


    # GET /articles
    def index
      if params[:category_id]
        category = Category.find(params[:category_id])

        @articles = Article.where(categories_id: category.id)
      else
        @articles = Article.all
      end

      render json: @articles

    end

    # GET /articles/1
    def show
      render json: @article.to_json(:include => {:comments => {:include => :users}})
    end

    # GET /articles/berita
    def show_by_category
      render json: @articlebycategory
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      @article.users_id = current_user.id
      if @article.save
        render json: @article, status: :created, location: [:v1, @article]
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      def set_article_by_category
        logger.debug params[:category_id]
        @articlebycategory = Article.where(cateories_id: params[:category_id])
      end

      # Only allow a trusted parameter "white list" through.
      def article_params
        params.permit(:title, :content, :image, :published_date, :categories_id, :subcategories_id)
      end
  end
end
