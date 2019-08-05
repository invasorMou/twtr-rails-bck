class Tweet < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  def created_by
    '@'+user.username
  end
end
