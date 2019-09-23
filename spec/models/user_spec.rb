# == Schema Information
#
# Table name: users
#
#  id                             :integer          not null, primary key
#  email                          :string
#  encrypted_password             :string           default(""), not null
#  reset_password_token           :string
#  reset_password_sent_at         :datetime
#  remember_created_at            :datetime
#  password                       :string
#  username                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  sent_follow_requests_count     :integer
#  received_follow_requests_count :integer
#  own_photos_count               :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:own_photos) }

    it { should have_many(:received_follow_requests) }

    it { should have_many(:sent_follow_requests) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    it { should have_many(:followers) }

    it { should have_many(:following) }

    it { should have_many(:liked_photos) }

    it { should have_many(:feed) }

    it { should have_many(:activity) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }
      
    end
end
