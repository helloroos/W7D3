class User < ApplicationRecord

    validates :session_token, presence: true, uniqueness: {case_sensitive: true}
    validates :password_digest, :username, presence: true
    
end