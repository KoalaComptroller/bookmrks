class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  default_scope -> { order(:name) }
  validates :user_id, presence: true
  validates :name,    presence: true, length: { maximum: 256 }
end
