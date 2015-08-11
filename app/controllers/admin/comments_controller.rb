class Admin::CommentsController < Admin::AdminApplicationController
  before_action :set_comment, only: [:show, :destroy]
  def index
    @comments_grid = initialize_grid(Comment,
                                     order: 'updated_at',
                                     order_direction: 'desc',
                                     per_page: 10)
  end

  def show
    
  end

  def destroy
    @comment.destroy
    redirect_to session[:previous_url] || admin_comments_url
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
  
end