class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :community

     def admin?
        
     end

end
