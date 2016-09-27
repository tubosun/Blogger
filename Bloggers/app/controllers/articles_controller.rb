class ArticlesController < ApplicationController
before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]
			include ArticlesHelper
	def index
		@articles = Article.all
	end
	def show
		@articles = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @articles.id
	end
	def new
		@articles = Article.new
	end
	def create
		@articles = Article.new(article_params)
		@articles.save
		flash.notice = "Article '#{@articles.title}' created!"
		redirect_to articles_path(@article) 
	end
	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy
		flash.notice = "Article '#{@articles.title}' deleted!"
		redirect_to articles_path(@article)
	end
	def edit
		@articles=Article.find(params[:id])
	end
	def update
	@articles=Article.find(params[:id])
	@articles.update(article_params)
	
	flash.notice = "Article '#{@articles.title}' updated!"
	redirect_to articles_path(@article)
	end
	
end
