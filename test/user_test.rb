require 'test_helper'

describe Music::User do
  it "initializes a user" do
    user = ::Music::User.new(id: 1, name: 'Sting')

    _(user.id).must_equal 1
    _(user.name).must_equal 'Sting'
  end

  it "hashes itself" do
    user = ::Music::User.new(id: 1, name: 'Sting')

    _(user.to_h).must_equal ({ id: 1, name: 'Sting' })
  end
end
