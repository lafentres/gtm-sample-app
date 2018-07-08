class HomeController < ApplicationController

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @posts = Post.newest_first.page(@page).per(5)
    @last_page = @posts.last_page? || @posts.out_of_range?

    respond_to do |format|
      format.html
      format.js {render :layout => false}
      format.all {render :text => "Invalid format."}
    end
  end

end