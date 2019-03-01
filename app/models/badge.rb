class Badge < ApplicationRecord
  validates :name, :image_url, :criterion, :param, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def self.criterion
    %i[first_try all_category all_level].map { |item| [I18n.t("admin.badges.#{item}"), item] }
  end
end
