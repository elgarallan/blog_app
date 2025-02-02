class CommentsController < ApplicationController
	before_action :set_post, only: [:index, :new, :create]
	before_action :set_comment, only: [:show]
  
	def index
	  @comments = Comment.where(post_id: @post.id)
	end
  
	def new
		@comment = @post.comments.build # This ensures @comment is not nil
	end
	  
	def create
	  @comment = Comment.new comment_params
	  @comment.post_id = @post.id
  
	  if @comment.save
		redirect_to post_path(@post)
	  else
		render :new
	  end
	end
  
	def edit
	end
  
	def update
	end
  
	def show
	end
  
	def delete
	end
  
	private
  
	def set_comment
	  @comment = Comment.find(params[:id])
	end
  
	def set_post
	  @post = Post.find(params[:post_id])
	end
  
	def comment_params
	  params.require(:comment).permit(:content, :author)
	end
  end