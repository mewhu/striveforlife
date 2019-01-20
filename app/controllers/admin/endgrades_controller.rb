class Admin::EndgradesController < Admin::BaseController
  # devise認證
  # [PS] 要改登入頁面的畫請改這個 app/views/devise/sessions/new.html.erb
  
  # 將admin的登入認證拆成 user登入+判斷是否admin+合併至admin::basecontroller後，註解掉以下這行
  # before_action :authenticate_user!
  # before_action :select_number_of_player

  def index
    @endgrades = Endgrade.all
    # @homeless_endgrades = Endgrade.where(job: "homeless")
    @endgrade = Endgrade.first
    @user = User.first
  end
end
