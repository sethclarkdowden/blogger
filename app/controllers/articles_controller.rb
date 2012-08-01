class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
	    @article = Article.new(params[:article])
	    @article.save

	    flash[:message] = "Article '#{@article.title}' has ben Created!"

	    redirect_to article_path(@article)
	end

	def destroy
		@article = Article.destroy(params[:id])

		flash[:message] = "Article '#{@article.title}' has ben Deleted!"

		redirect_to articles_path
	end

	def edit
			@article = Article.find(params[:id])	
	end

	def update
	    @article = Article.find(params[:id])
	    @article.update_attributes(params[:article])

	    flash[:message] = "Article '#{@article.title}' has ben Updated!"

	    redirect_to article_path(@article)
  end

  def tags
  end
  
end
