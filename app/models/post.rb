class Post < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validate :start, :end

  def start
    return if start_date.blank?
    errors.add(:start_date,"は今日以降のものを選択してください") if start_date < Date.current
  end

  def end
    return if end_date.blank?
    errors.add(:end_date,"は開始日以降のものを選択してください") if end_date < start_date
  end
end

