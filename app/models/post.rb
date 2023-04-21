class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start, :finish, presence: true
  validates :memo, length: {maximum: 500}
  validate :start_finish_check

  def start_finish_check
    if self.start == nil || self.finish == nil
      errors.add :start, :finish, message: "は空欄にしないでください"
    elsif self.finish < self.start
      errors.add :finish, message: "日付が無効です"
    end
  end


end
