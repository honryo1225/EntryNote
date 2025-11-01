class TweetsController < ApplicationController

 before_action :authenticate_user!, only: [:new, :create]

def index
    @tweet= Tweet.all
    @tags = Tag.all
    @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.take(5)

    @tweet = @tweet.where("kigyoumei LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    
    if params[:tag_ids].present?
      tweet_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).tweets.each do |p| 
            tweet_ids << p.id
          end
        end 
      end
    tweet_ids = tweet_ids.uniq
    @tweet = @tweet.where(id: tweet_ids) if tweet_ids.present?
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    
    tweet.user_id = current_user.id

    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
    
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

 

    
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:kigyoumei, :start_time, :mypage_url, :image, tag_ids: [])
  end    

end


