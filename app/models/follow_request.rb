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

class FollowRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => :received_follow_requests_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_follow_requests_count

  # Indirect associations

  # Validations

  validates :recipient_id, :uniqueness => { :scope => [:sender_id], :message => "already requested" }

  validates :recipient_id, :presence => true

  validates :sender_id, :presence => true

end
