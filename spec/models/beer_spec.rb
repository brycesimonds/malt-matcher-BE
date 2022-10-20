require 'rails_helper'

RSpec.describe Beer, type: :model do
  it { should validate_presence_of :catalog_beer_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :style }
  it { should allow_value("", nil).for(:description) }
  it { should allow_value("", nil).for(:ibu) }
  it { should allow_value("", nil).for(:abv) }
  it { should validate_presence_of :catalog_brewery_id }
  it { should validate_presence_of :last_modified }
  it { should belong_to :brewery }
end
