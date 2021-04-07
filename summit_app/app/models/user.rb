class User < ApplicationRecord

    validates :username, :session_token, presence: true, uniqueness: {case_sensitive: true}
    validates :password_digest, presence: true
    
end