class Micropost < ApplicationRecord
    belongs_to :user, optional: true
    validates :title, length: { maximum: 140 }, presence: true
    validate :one_empty
    validate :unique_url
    
    acts_as_votable cacheable_strategy: :update_columns
    acts_as_commentable
    
    def one_empty
        if (url == "" && text == "")
          errors.add :base, "At least fill url or text"
        end
        if (url != "" && text != "")
          errors.add :base, "Fill url or text"
        end
    end
    
    def unique_url
        if (url != "") 
            validates :url, uniqueness: true
        end
    end

end
