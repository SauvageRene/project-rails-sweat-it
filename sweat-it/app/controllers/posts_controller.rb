class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_community, only: [:show]
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        @post.user_id = current_user.id

        if @post.save
            redirect_to community_path(@post.community_id)
        else
            render :new
        end
    end

    private


    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end

end