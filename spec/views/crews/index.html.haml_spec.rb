require 'spec_helper'

describe "crews/index" do
  before(:each) do
    assign(:crews, [
      stub_model(Crew,
        :age => 1,
        :name => "Name",
        :avatar => "Avatar",
        :title => "Title",
        :species => "Species",
        :origin => "Origin",
        :quote => "Quote"
      ),
      stub_model(Crew,
        :age => 1,
        :name => "Name",
        :avatar => "Avatar",
        :title => "Title",
        :species => "Species",
        :origin => "Origin",
        :quote => "Quote"
      )
    ])
  end

  it "renders a list of crews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Species".to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Quote".to_s, :count => 2
  end
end
