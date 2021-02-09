# == Schema Information
#
# Table name: sights
#
#  id            :bigint           not null, primary key
#  activity_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  place_id      :bigint           not null
#
# Indexes
#
#  index_sights_on_place_id  (place_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#
require 'rails_helper'

RSpec.describe Sight, type: :model do
  describe '#valid?' do
    it 'is invalid when activity_type is blank' do
      sight = create(:sight)
      expect(sight).to be_valid

      sight.activity_type = ''
      expect(sight).to be_invalid
    end
  end
end
