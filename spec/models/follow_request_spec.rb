# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe FollowRequest, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:recipient) }

    it { should belong_to(:sender) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:recipient_id).scoped_to(:sender_id).with_message('already requested') }

    it { should validate_presence_of(:recipient_id) }

    it { should validate_presence_of(:sender_id) }
      
    end
end
