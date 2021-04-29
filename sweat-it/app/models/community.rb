class Community
    belongs_to :user
    validates_presence_of :url, :name, :bio
end