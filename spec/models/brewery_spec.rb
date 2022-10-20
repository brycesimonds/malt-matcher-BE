require 'rails_helper'

RSpec.describe Brewery, type: :model do
  it { should validate_presence_of :catalog_brewery_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :distance_from_user }
  it { should allow_value("", nil).for(:brewery_description) }
  it { should validate_presence_of :website }
  it { should validate_presence_of :instagram }
  it { should validate_presence_of :facebook }
  it { should validate_presence_of :twitter }

  it { should have_many :beers }
end
