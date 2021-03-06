class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to "/"
      flash[:notice] = "ツイートを送信しました。"
    else
      redirect_to new_tweet_path
      flash[:alert] = "ツイートに失敗しました。"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to "/"
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.update_attributes(tweet_params)
      redirect_to "/"
    else
      render action: :edit
    end
  end


  private
    def tweet_params
      params.require(:tweet).permit(:text).merge(user_id: current_user.id)
    end
end
