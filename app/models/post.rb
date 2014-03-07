class Post < ActiveRecord::Base
mount_uploader :picture, PictureUploader

  attr_accessible :body, :title, :picture

  validates_presence_of :body, :title

end
