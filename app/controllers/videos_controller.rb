class VideosController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :only_my_videos, only: [:destroy, :edit, :update]

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
      if @video.save
        redirect_to videos_path
      else
       render 'new'
      end
  end

  def update
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to videos_path
  end

  private
  def video_params
    params.require(:video).permit(:title, :urlLink, :user_id)
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def only_my_videos
      redirect_to root_path, notice: "you can't delete other people's videos" if (current_user != @video.user)
  end

end
