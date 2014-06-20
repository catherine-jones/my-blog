# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "lipsum"
Post.destroy_all
20.times do
  t = Lipsum.new( )
  t.paragraphs[3]
  date = Date.new(2014, rand * 12 + 1, rand * 27 + 1)
  post = Post.create!(title: "This is a title", body: t.to_s)
  post.created_at = date
  post.save!
end
