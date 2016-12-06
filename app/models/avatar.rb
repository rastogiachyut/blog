class Avatar < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }#, size: { in: 0..10.kilobytes }

  belongs_to :user

  def source(type)
    source_string = self.image.url(type)
    source_string.slice!('achyut-blog-assets/')
    source_string
  end
end
