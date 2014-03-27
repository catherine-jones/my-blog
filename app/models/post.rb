class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  attr_accessible :body, :title, :picture, :tag_list
  
  acts_as_taggable_on :tags

  validates_presence_of :body, :title

  scope :tagged_with, ->(tag_name) { includes(:tags).where('tags.name = ?',tag_name)}

end
