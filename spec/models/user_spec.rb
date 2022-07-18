require 'rails_helper'

RSpec.describe User, type: :model do
    describe "relationships" do
        it { should have_many :party_users }
        it { should have_many(:parties).through(:party_users) }
        it { should validate_presence_of :password_digest}
    end

end
