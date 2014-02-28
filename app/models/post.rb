class Post < ActiveRecord::Base
mount_uploader :picture, PictureUploader

  attr_accessible :body, :title

  has_many :comments

  validates_presence_of :body, :title

end
