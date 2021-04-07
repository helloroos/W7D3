class User < ApplicationRecord

    validates :session_token, presence: true, uniqueness: { case_sensitive: true }
    validates :password_digest, :username, presence: true
    attr_reader :password
    after_initialize :ensure_session_token
   
    #FIGVAPER

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def is_password?(password)
        p = BCrypt::Password.new(self.password_digest)
        p.is_password?(password)
    end


    
end