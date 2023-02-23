# == Schema Information
#
# Table name: toys
#
#  id           :bigint           not null, primary key
#  name         :string
#  toyable_type :string           not null
#  toyable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Toy < ApplicationRecord
  validates :name, :toyable_type, :toyable_id, presence: true
  validates :name, uniqueness: { scope: :toyable_type, :toyable_id }

  belongs_to :toyable_id, polymorphic: true
end