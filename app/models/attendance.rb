class Attendance < ApplicationRecord
  belongs_to :user

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }

  # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  # (検証）started_atなしではfinished_atは無効です
  
  # 出勤時間のみの場合、無効 
  # validate :not_valid_if_only_work_time
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :started_at_than_finished_at_fast_if_invalid
  
  
  def finished_at_is_invalid_without_a_started_at
     errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
    # started_at＝出勤時間　blank＝空白 present=存在する
  end
  
  # def not_valid_if_only_work_time
  #   errors.add(:finished_at, "が必要です") if started_at.present? 
  # end
  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if started_at > finished_at
    end
  end
end