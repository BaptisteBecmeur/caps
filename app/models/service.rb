class Service < ApplicationRecord
  belongs_to :user
  has_many :uploads, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :cover, PhotoUploader

  TAGS = ["Magicien", "Jongleur", "Danseur", "Humoriste"]

  validates :tag, inclusion: { in: Service::TAGS, allow_nil: false }


  def full_address
    "#{address}, #{zip_code} #{city} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end
end

