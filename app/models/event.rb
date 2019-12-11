class Event < ApplicationRecord
  belongs_to :creator, class_name: "User" 
  belongs_to :address
  belongs_to :event_type
  has_many :comments, dependent: :destroy
  has_many :appointments, dependent: :destroy 
  has_many :users, through: :appointments  
  has_many :product_events, dependent: :destroy
  has_many :products, through: :product_events
  include Feedbackable

  after_create :event_creation_user
  #after_update :event_edit_user
  # validates :title,
  #   presence: true,
  #   length: {maximum: 30}

  # validates :description,
  #   presence: true,
  #   length: {maximum: 250}
  
  validates :start_date, presence: true, 
  date: { after: Proc.new { Time.now }}

  validates :end_date, presence: true,
  date: { after: :start_date }

  def event_creation_user
    EventMailer.new_event_user(self).deliver_now
  end
  
  def event_edit_user
    EventMailer.event_edit_user(self).deliver_now
  end
  
end

