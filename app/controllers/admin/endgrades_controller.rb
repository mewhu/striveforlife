class Admin::EndgradesController < ApplicationController
  # devise認證
  # [PS] 要改登入頁面的畫請改這個 app/views/devise/sessions/new.html.erb
  before_action :authenticate_user!

  def index
  end
end
