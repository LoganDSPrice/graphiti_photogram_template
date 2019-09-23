# == Schema Information
#
# Table name: photos
#
#  id                         :integer          not null, primary key
#  caption                    :string
#  image                      :string
#  owner_id                   :integer
#  location                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  likes_count                :integer
#  comments_count             :integer
#  location_latitude          :float
#  location_longitude         :float
#  location_formatted_address :string
#

require 'rails_helper'

RSpec.describe Photo, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    it { should have_many(:fans) }

    it { should have_many(:followers) }

    it { should have_many(:fan_followers) }

    end

    describe "Validations" do

    it { should validate_presence_of(:image) }

    it { should validate_presence_of(:owner_id) }
      
    end
end
