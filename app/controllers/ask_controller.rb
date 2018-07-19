class AskController < ApplicationController
  def show
    @microposts = Micropost.where(url: "").order(:cached_votes_total => :desc)
  end
end
