class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :entry_id, presence: true
  validates :context, presence: true, length: { maximum: 140 }
end
