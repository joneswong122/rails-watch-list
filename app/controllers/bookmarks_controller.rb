class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]

  def new
    set_list
    @bookmark = Bookmark.new
  end

  def show
    set_list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :rating)
  end
end
