#   Copyright (c) 2010-2011, Rails4Bp Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'spec_helper'

describe 'making sure the spec runner works' do
  it 'factory creates a user with a person saved' do
    user = FactoryGirl.create(:user)
    loaded_user = User.find(user.id)
    loaded_user.user.owner_id.should == user.id
  end

  describe 'fixtures' do
    it 'loads fixtures' do
      User.count.should_not == 0
    end
  end

end
