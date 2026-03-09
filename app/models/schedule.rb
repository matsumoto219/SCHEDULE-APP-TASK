class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }      # タイトル文字数 MAX20
  validates :start_date, presence: true                          # 開始日は必須
  validates :end_date, presence: true                            # 終了日は必須
  validates :memo, length: { maximum: 500 }                      # メモ最大文字数 MAX500
  validate :end_date_after_start_date                            # 終了日が開始日より前にならないようチェック

  private

  def end_date_after_start_date                                  # 開始日より前の終了日が入力された場合にエラーを追加する処理
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end
end
