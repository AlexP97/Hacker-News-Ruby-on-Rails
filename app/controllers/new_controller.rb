class NewController < ApplicationController
  def show
    @microposts = Micropost.all.order("created_at DESC")
  end
end
