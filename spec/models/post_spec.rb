require 'rails_helper'

RSpec.describe Post, type: :model do
  it {should belong_to(:user)}
  it {should have_many(:comments).dependent(:destroy)}
  it {should validate_presence_of(:title) }
  it {should validate_presence_of(:body) }
end