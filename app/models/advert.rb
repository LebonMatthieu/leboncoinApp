class Advert < ApplicationRecord
  def self.search(search)
    where("title LIKE ? OR description LIKE ? OR price LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true,
            length: { minimum: 5 }


  has_attached_file :image, styles: { medium: "700x300>", thumb: "100x100>" }, default_url:lambda {|image| ActionController::Base.helpers.asset_path("assets/default.jpg")}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
