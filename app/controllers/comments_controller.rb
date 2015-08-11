class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    Comment.create(commentable: @commentable, 
                   username: params[:comment][:username],
                   email: params[:comment][:email],
                   content: params[:comment][:content])
    redirect_to polymorphic_url(@commentable)
  end
  
  private

  def set_commentable
    klass = Comment::SOURCES.detect{|c| params["#{c.name.underscore}_id"]}
    @commentable = klass.friendly.find(params["#{klass.name.underscore}_id"])
  end
  
end