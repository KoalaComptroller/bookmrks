class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      flash[:success] = "Bookmark added!"
      redirect_to :back
    else
      flash[:danger] = "Something went wrong!"
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:title, :url)
    end
end
