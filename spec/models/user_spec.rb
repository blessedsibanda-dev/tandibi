# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  is_public  :boolean          default(TRUE), not null
#  last_name  :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  describe "#valid?" do
    it "is valid when email is unique" do
      user1 = create(:user)
      user2 = create(:user)
      expect(user1.email).not_to be user2.email
      expect(user1.valid?).to be true
      expect(user2.valid?).to be true
    end
    it "is invalid when email is taken" do
      create :user, email: "blessed@example.org"
      user = build(:user, email: "blessed@example.org")
      expect(user).not_to be_valid
    end
    it "is valid if the username is unique" do
      user = create(:user)
      another_user = create(:user)

      expect(user).to be_valid
      another_user.username = user.username
      expect(another_user).not_to be_valid
    end
    it "is invalid when first_name is blank" do
      user = create(:user)
      expect(user).to be_valid

      user.first_name = ""
      expect(user).not_to be_valid
    end
    it "is invalid if the email looks bogus" do
      user = create(:user)
      expect(user).to be_valid

      user.email = ""
      expect(user).not_to be_valid

      user.email = "foo.bar#example.com"
      expect(user).not_to be_valid

      user.email = "foo.bar"
      expect(user).not_to be_valid

      user.email = "f.o.o.b.a.r@example.com"
      expect(user).to be_valid

      user.email = "foo+bar@example.com"
      expect(user).to be_valid
      
      user.email = "foo.bar@sub.example.co.id"
      expect(user).to be_valid
    end
  end
end
