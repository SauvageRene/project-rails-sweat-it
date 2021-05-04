class SubscriptionsController < ApplicationController
    
    def create
        @subscription = current_user.subscription.build(subscription_params)
        @subscription.save
            redirect_to community_path(@subscription.community_id)
    end

    def subscription_params
        params.require(:subscription).permit(:community_id)
    end
end