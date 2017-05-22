class Service < ApplicationRecord
  belongs_to :user
  has_many :uploads, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :cover, PhotoUploader
end
