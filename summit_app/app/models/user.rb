class User < ApplicationRecord

    validates :session_token, presence: true, uniqueness: { case_sensitive: true }
    validates :password_digest, :username, presence: true
    attr_reader :password
    after_initialize :ensure_session_token
   
    has_many :goals,
        primary_key: :id,
        foreign_key: :owner_id,
        class_name: :Goal

    has_many :comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Comment


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

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64(16)
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64(16)
    end

    
end