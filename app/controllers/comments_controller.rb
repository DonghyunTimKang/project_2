class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  before_action :only_my_comments, only: [:destroy, :edit, :update]

  def index
    @comments=Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
      if @comment.save
        redirect_to videos_path
      else
       render 'new'
    end
  end

  def edit
      @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])
    @comment.user = current_user
      if @comment.update(comment_params)
        redirect_to videos_path
      else
       render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to videos_path
  end


private
  def comment_params
    params.require(:comment).permit(:comment, :video_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def only_my_comments
      redirect_to root_path, notice: "you can't change other people's comments" if (current_user != @comment.user)
  end

end
