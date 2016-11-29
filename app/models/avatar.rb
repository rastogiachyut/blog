class Avatar < ApplicationRecord
  has_attached_file :image, 
                  styles: { medium: "300x300>", thumb: "100x100>" }
                  storage: :s3,
                  bucket: 'achyut-blog-assets',
                  s3_credentials: "#{Rails.root}/config/aws.yml",
                  path: "resources/:id/:style/:basename.:extension"
                  #, default_url: "/images/:style/missing.png"
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }#, size: { in: 0..10.kilobytes }

  belongs_to :user

end
