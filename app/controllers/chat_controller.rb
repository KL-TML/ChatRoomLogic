class ChatController < ApplicationController

  def login

  end

  def add_user
    cookies.permanent[:room] = params[:room]
    redirect_to "/chat_room?#{params[:username]}"
  end

  def chat_room

  end
end
