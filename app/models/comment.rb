class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates_presence_of :username, on: :create, message: "can't be blank"
  validates_presence_of :email, on: :create, message: "can't be blank"
  validates_presence_of :content, on: :create, message: "can't be blank"

  SOURCES = [News, Page]
end
