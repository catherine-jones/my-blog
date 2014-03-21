class Post < ActiveRecord::Base
mount_uploader :picture, PictureUploader

  attr_accessible :body, :title, :picture
  acts_as_taggable_on :tags

  validates_presence_of :body, :title

end
