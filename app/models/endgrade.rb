class Endgrade < ApplicationRecord
  # 以store + accessors 做出進階版的"serialize"
  store :mission_1, :accessors  => [:m1_on_off, :m1_is_done, :m1_intro]
  store :mission_2, :accessors  => [:m2_on_off, :m2_is_done, :m2_intro]
  serialize :players_mode, Array
  before_save :update_house_state
  belongs_to  :survey

  private
  def update_house_state
    # 先計算自身的租屋狀態
    case  self.job
    when  "homeless"
      self_rent_house_check
    end
  end

  def self_rent_house_check
    case  self.name
    when  "林秀妹"
      if self.mission_2[:m2_is_done] == "true"
        self.self_house_state = true
      else
        self.self_house_state = false
      end
    else
      if self.is_kindhearted_landlord
        case  self.name
        when  "阿枝", "小花花"
          if self.asset >= 9000
            self.self_house_state = true
          else
            self.self_house_state = false
          end 
        else
          if self.asset >= 4000
            self.self_house_state = true
          else
            self.self_house_state = false
          end
        end
      else
        case  self.name
        when  "阿枝", "小花花"
          if self.asset >= 10000
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
    end
  end
end