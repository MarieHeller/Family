class Picture < ApplicationRecord
  belongs_to :fam
  mount_uploader :photo, PhotoUploader
end
