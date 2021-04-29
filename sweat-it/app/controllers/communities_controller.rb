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
    end

end