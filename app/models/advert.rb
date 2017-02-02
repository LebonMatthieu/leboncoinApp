class Advert < ApplicationRecord

  belongs_to :user
  belongs_to :category

  validates :title, presence: true,
            length: { minimum: 5 }


  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:lambda {|image| ActionController::Base.helpers.asset_path("assets/default.jpg")}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
