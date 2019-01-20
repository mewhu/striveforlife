class Endgrade < ApplicationRecord
  # 以store + accessors 做出進階版的"serialize"
  store :mission_1, :accessors  => [:m1_on_off, :m1_is_done, :m1_intro]
  store :mission_2, :accessors  => [:m2_on_off, :m2_is_done, :m2_intro]
  serialize :players_mode, Array
  before_save :calculate_ending
  belongs_to  :survey

  private
  def calculate_ending
    # 先計算自身的租屋狀態
    case  self.job
    when  "homeless"
      self_rent_house_check
    end

    # 再來計算各別角色的任務以及隊友的租屋狀態
    # 阿和篇
    case  self.name 
    when  "阿和"
      if self.self_house_state
        if self.mission_1[:m1_is_done]
          self.ending_number = 1
        else
          self.ending_number = 2
        end
      else
        self.ending_number = 22
      end
    when  "阿俊"
      Rails.logger.debug "阿俊中"
      puts "puts 阿俊中"
      if self.self_house_state
        if partner_rent_house_check("小胖")
          Rails.logger.debug("小胖租到房子")
          puts "小胖租到房子"
          self.ending_number = 3
        else
          Rails.logger.debug("小胖在外流浪")
          puts "小胖在外流浪"
          self.ending_number = 4
        end
      else
        puts "阿俊自己正在流浪"
        self.ending_number = 22
      end
    when  "小胖"
      if self.self_house_state
        if partner_rent_house_check("阿俊")
          self.ending_number = 17
        else
          self.ending_number = 16
        end
      else
        self.ending_number = 22
      end
    when  "阿枝"
      if self.mission_1[:m1_is_done]
        if self.self_house_state
          self.ending_number = 6
        else
          self.ending_number = 5
        end
      else
        self.ending_number = 22
      end
    when  "賈西亞"
      if self.self_house_state
        if partner_rent_house_check("阿枝")
          self.ending_number = 9
        else
          self.ending_number = 10
        end
      else
        self.ending_number = 22
      end
    when  "小花花"
      if self.mission_1[:m1_is_done]
        if self.self_house_state
          self.ending_number = 15
        else
          self.ending_number = 14
        end
      else
        self.ending_number = 24
      end
    when  "林秀妹"
      if self.mission_1[:m1_is_done]
        if self.mission_2[:m2_is_done]
          self.ending_number = 11
        else
          self.ending_number = 13
        end
      else
        if self.mission_2[:m2_is_done]
          self.ending_number = 12
        else
          self.ending_number = 22
        end
      end
    when  "陳俊福"
      if self.self_house_state
        if self.mission_1[:m1_is_done]
          self.ending_number = 7
        else
          self.ending_number = 8
        end
      else
        self.ending_number = 22
      end
    when  "張明雄"
      if self.mission_1[:m1_is_done]
        if self.asset >= 5000
          self.ending_number = 18
        else
          self.ending_number = 19
        end
      else
        if self.self_house_state
          self.ending_number = 20
        else
          self.ending_number = 22
        end
      end
    when  "阿孝"
      if self.asset >= ((Survey.first.number_of_players - 2)*0.5).round
        self.ending_number = 21
      else
        self.ending_number = 23
      end
    when  "小家"
      if self.asset >= ((Survey.first.number_of_players - 2)*0.5).round
        self.ending_number = 21
      else
        self.ending_number = 23
      end
    end
  end

  def self_rent_house_check
    if self.is_kindhearted_landlord
      if self.asset >= 4000
        self.self_house_state = true
      else
        self.self_house_state = false
      end
    else
      if self.asset >= 5000
        self.self_house_state = true
      else
        self.self_house_state = false
      end
    end
  end


  def partner_rent_house_check(arg1)
    # 用Endgrade.where(條件)取出來的東西是"ActiveRecord::Relation"物件，不是instance model data
    # 可以再補一個".first"，例如: @partner.first，以確實取出第一個instance model data
    @partner = Endgrade.where(name: arg1)
    if @partner.first.self_house_state
      return true
    else
      return false
    end
  end
end