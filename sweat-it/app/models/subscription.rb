class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :community

    # def admin
    #     if Community.subscribers.first == self.user_id 
            

    #     end
    # end
    
end
