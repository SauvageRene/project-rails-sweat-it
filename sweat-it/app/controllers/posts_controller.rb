class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:show]

    
    def index
        @posts = Post.all
    end

    def show
        
    end

    def new
        @community = Community.find(params[:community_id])
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        @post.user_id = current_user.id
        @post.community_id = params[:community_id]

        if @post.save
            redirect_to community_path(@post.community_id)
        else
            @community = Community.find(params[:community_id])
            render :new
        end
    end

    private


    def set_post
        @post = Post.find(params[:id])
    end

    def auth_subscriber
        unless Subscription.where(community_id: params[:community_id], user_id: current_user.id).any?
            redirect_to root_path, flash: {danger: You are not authorized to view this page}
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end

end