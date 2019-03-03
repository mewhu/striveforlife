class Admin::SurveysController < Admin::BaseController
  before_action :target_survey, :only => [:update_number_of_player,
                                          :edit_endgrades,
                                          :update_endgrades,
                                          :update_endings,
                                          :go_endings,
                                          :show_endings]
  def index
    @survey = Survey.first
  end

  def update_number_of_player
    puts  "------ follwoing is debug zone ------"
    Rails.logger.debug  survey_params
    puts  "------ above is debug zone ------"
    if @survey.update_attributes(survey_params)
      Rails.logger.debug("更新遊玩人數  成功!")
      redirect_to edit_endgrades_admin_survey_path
    else
      Rails.logger.debug("更新遊玩人數  失敗...")
      @survey = Survey.first
      render :action => :index
    end
  end

  def edit_endgrades
    @homelesses = Endgrade.where(job: "homeless")
    @social_workers = Endgrade.where(job: "social_worker")
  end

  def update_endgrades

    if @survey.update_attributes(survey_params)
      # 暫時想不到如何把小家的成功個案直接連動到阿孝的成功個案, 先醜寫一次
      @ashaw = Endgrade.where(name:  "阿孝").first
      @tiachia = Endgrade.where(name:  "小家").first
      @tiachia.asset = @ashaw.asset
      @tiachia.save!
      
      Rails.logger.debug("更新結算成績及個人租屋狀態  成功!")
      update_endings
    else
      Rails.logger.debug("更新結算成績及個人租屋狀態  失敗...")
      @survey = Survey.first
      render :action => :index
    end
  end

  def update_endings
    Rails.logger.debug("--- Controller action : update_endings --- ")
    @all_endgrades = Endgrade.all
    @all_endgrades.each do |endgrade|
      calculate_endings(endgrade)
      if endgrade.save
        Rails.logger.debug("Successfully update #{endgrade.name}'s ending")
      else
        Rails.logger.debug("Fail to update #{endgrade.name}'s ending")
      end
    end
    redirect_to go_endings_admin_survey_path
    # 從survey出發的endgrade沒有如預期被更改, 因此我預期以 @survey.update_attribute(survey_params)這個方式並不會更新ending
    # ps: survey_params只有在一開始的"更新人數"及後續"填完endgrade表單"，也就是，它是從使用者端送進server時的封包裡得到使用者於view中調整的數值。
    # Rails.logger.debug  @survey.endgrades.first.ending_number

    # 從all_endgrades出發的endgrade有如預期被calculate_endings()更改
    # Rails.logger.debug  @all_endgrades.first.ending_number
  end

  def go_endings
    @endgrades = Endgrade.all
  end

  def show_endings
    @endgrades = Endgrade.all
  end

  private
  def survey_params
    params.require(:survey).permit(:number_of_players,
                                   endgrades_attributes: [:id, 
                                                          :asset, 
                                                          :is_kindhearted_landlord, 
                                                          :m1_is_done,
                                                          :m2_is_done])
  end

  def target_survey
    @survey = Survey.find(params[:id])
  end

  def calculate_endings(endgrade)
    case  endgrade.name
    when  "阿和"
      Rails.logger.debug("in 阿和")
      if endgrade.self_house_state
        if endgrade.mission_1[:m1_is_done]
          Rails.logger.debug("ending is 1")
          endgrade.ending_number = 1
        else
          Rails.logger.debug("ending is 2")
          endgrade.ending_number = 2
        end
      else
        Rails.logger.debug("ending is 22")
        endgrade.ending_number = 22
      end
    when  "阿俊"
      Rails.logger.debug "阿俊中"
      puts "puts 阿俊中"
      if endgrade.self_house_state
        if partner_rent_house_check("小胖")
          Rails.logger.debug("小胖租到房子")
          puts "小胖租到房子"
          endgrade.ending_number = 3
        else
          Rails.logger.debug("小胖在外流浪")
          puts "小胖在外流浪"
          endgrade.ending_number = 4
        end
      else
        puts "阿俊自己正在流浪"
        endgrade.ending_number = 22
      end
    when  "小胖"
      if endgrade.self_house_state
        if partner_rent_house_check("阿俊")
          endgrade.ending_number = 17
        else
          endgrade.ending_number = 16
        end
      else
        endgrade.ending_number = 22
      end
    when  "阿枝"
      if endgrade.asset >= 5000
        if endgrade.self_house_state
          endgrade.ending_number = 6
        else
          endgrade.ending_number = 5
        end
      else
        endgrade.ending_number = 22
      end
    when  "賈西亞"
      if endgrade.self_house_state
        if partner_rent_house_check("阿枝")
          endgrade.ending_number = 9
        else
          endgrade.ending_number = 10
        end
      else
        endgrade.ending_number = 22
      end
    when  "小花花"
      if endgrade.asset >= 5000
        if endgrade.self_house_state
          endgrade.ending_number = 15
        else
          endgrade.ending_number = 14
        end
      else
        endgrade.ending_number = 24
      end
    when  "林秀妹"
      if endgrade.mission_1[:m1_is_done] == "true"
        if endgrade.mission_2[:m2_is_done] == "true"
          endgrade.ending_number = 11
        else
          endgrade.ending_number = 13
        end
      else
        if endgrade.mission_2[:m2_is_done] == "true"
          endgrade.ending_number = 12
        else
          endgrade.ending_number = 22
        end
      end
    when  "陳俊福"
      Rails.logger.debug  "in 陳~!!!!!!"
      if endgrade.self_house_state
        @partner = Endgrade.where(name: "林秀妹").first
        Rails.logger.debug  @partner.self_house_state
        if @partner.self_house_state
          endgrade.ending_number = 7
        else
          endgrade.ending_number = 8
        end
      else
        endgrade.ending_number = 22
      end
    when  "張明雄"
      if endgrade.mission_1[:m1_is_done] == "true"
        if endgrade.asset >= 5000
          endgrade.ending_number = 18
        else
          endgrade.ending_number = 19
        end
      else
        if endgrade.self_house_state
          endgrade.ending_number = 20
        else
          endgrade.ending_number = 22
        end
      end
    when  "阿孝", "小家"
      Rails.logger.debug  endgrade.name
      Rails.logger.debug  endgrade.asset
      if endgrade.asset >= ((Survey.first.number_of_players - 2)*0.5).round
        endgrade.ending_number = 21
      else
        endgrade.ending_number = 23
      end
      Rails.logger.debug  endgrade.ending_number
    end
  end

  def partner_rent_house_check(arg1)
    # 用Endgrade.where(條件)取出來的東西是"ActiveRecord::Relation"物件，不是instance model data
    # 可以再補一個".first"，例如: @partner.first，以確實取出第一個instance model data
    @partner = Endgrade.where(name: arg1).first
    if @partner.self_house_state
      return true
    else
      return false
    end
  end
end
