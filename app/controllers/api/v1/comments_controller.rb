module Api::V1
  class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :admins!, only: [:update, :destroy]

    # GET /comments
    def index
      @comments = Comment.all

      render json: @comments.to_json(:include => :users)
    end

    # GET /comments/1
    def show
      render json: @comment.to_json(:include => :users)
    end

    # POST /comments
    def create
      @comment = Comment.new(comment_params)
      @comment.users_id = current_user.id

      if @comment.save
        render json: @comment.to_json(:include => :users), status: :created, location: [:v1, @comment]
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /comments/1
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /comments/1
    def destroy
      @comment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:users_id, :content, :lastedited, :created, :articles_id)
      end
  end
end