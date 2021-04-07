require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe User, type: :model do

    subject(:user) do
        FactoryBot.build(:user,
        username: "climber12",
        password: "password")
    end

    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
    # it { should have_many(:goals)}
    # it { should have_many(:comments)}
    # it { should have_many(:views)}

end

    # validation
        # presence of :username, :password_digest, :session_token
        # uniqueness_of :username, :session_token
    # association
        # goals
        # comments
        # views
    # methods
        # FIGAPER