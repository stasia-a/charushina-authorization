class StaticPagesController < ApplicationController
  skip_before_filter  :session_required, :confirmed_session_required, :user_required, :only => [:main, :help]#, :signed_in_user, only: [ :help, :main ]

  def home
  end

  def about
  end

  def help
  end

  def main
  end
end
