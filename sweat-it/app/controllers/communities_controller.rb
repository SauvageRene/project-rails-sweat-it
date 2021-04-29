class CommunitiesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @communities = Community.all
    end

    def show
        
    end

    def new
        @community = Community.new
    end

    def create
        @community = Community.new(community_values)
        @community.account_id = current_user.id

        if @community.save
            redirect_to communities_path
        else
            render :new
        end
    end

    private

    def community_values
        params.require(:community).permit(:name, :url, :bio)
    end

end