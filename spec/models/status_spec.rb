# == Schema Information
#
# Table name: statuses
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Status, type: :model do
  describe '#valid?' do
    it 'is invalid when text is blank' do
      status = create(:status)
      expect(status).to be_valid

      status.text = ''
      expect(status).to be_invalid
    end
  end
end
