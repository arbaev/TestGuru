# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image_url, :criterion, :param, presence: true

  enum criterions: %i[first_try all_category all_level]
end
