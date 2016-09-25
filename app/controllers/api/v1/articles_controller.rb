module Api::V1   
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy]
    before_action :admins!, only: [:create, :update, :destroy]


    # GET /articles
    def index
      @articles = Article.all

      render json: @articles
    end

    # GET /articles/1
    def show
      render json: @article.to_json(:include => {:comments => {:include => :users}})
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

      # Only allow a trusted parameter "white list" through.
      def article_params
        params.require(:article).permit(:title, :content, :image, :published_date)
      end
  end
end
