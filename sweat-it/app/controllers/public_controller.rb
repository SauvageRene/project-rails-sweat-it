class PublicController < ApplicationController

    def index
        # @communities = Community.all.limit(5)
        @communities = Community.newest_communities
        @posts = Post.order(id: :desc).limit(20)
    end

    def profile
        @profile = User.find_by_username params[:username]
        @posts = @profile.posts
    end

end