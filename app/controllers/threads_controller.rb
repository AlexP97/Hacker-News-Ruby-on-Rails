class ThreadsController < ApplicationController
  before_action :authenticate
  def show
    @comments = Comment.where(user_id: current_user.id)
  end
end