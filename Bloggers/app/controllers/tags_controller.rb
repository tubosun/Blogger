class TagsController < ApplicationController
before_filter :require_login, only: [:destroy]
def index
	@tag = Tag.all
end
def show
	@tag = Tag.find(params[:id])
end
def destroy
	@tag = Tag.find(params[:id])
	@tag.destroy
	flash.notice = "Tag '#{@tag.name}' deleted"
	redirect_to tag_path(@tag)
end
end
