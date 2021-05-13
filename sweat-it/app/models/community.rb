class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
    validates_presence_of :url, :name, :bio
    has_many :subscriptions
    has_many :subscribers, through: :subscriptions, source: :user

    # scope :newest_communities, order(created_at: :desc).limit(5)
    scope :newest_communities, -> (num = 5) { order('created_at DESC').limit(num) } #using lambda to declare a condition


end