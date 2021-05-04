class CommunitiesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_community, only: [:show]
    
    def index
        @communities = Community.all
    end

    def show
        @posts = @community.posts
        @subscriber_count = @community.subscribers.count
        is_subscribed
        @subscription = Subscription.new
    end

    def new
        @community = Community.new
    end

    def create
        @community = Community.new(community_values)
        @community.user_id = current_user.id

        if @community.save
            redirect_to communities_path
        else
            render :new
        end
    end

    def is_subscribed
        @is_subscribed = user_signed_in? ? Subscription.find_by(community_id: @community_id, user_id: current_user.id) : false
    end

    private


    def set_community
        @community = Community.find(params[:id])
    end

    def community_values
        params.require(:community).permit(:name, :url, :bio)
    end

end