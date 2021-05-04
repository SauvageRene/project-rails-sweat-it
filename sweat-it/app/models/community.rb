class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
    validates_presence_of :url, :name, :bio
    has_many :subscriptions
    has_many :subscribers, through: :subscriptions, source: :user
end