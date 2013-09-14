require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :first_name => "First Name",
        :last_name => "Last Name",
        :image_url => "Image Url",
        :image_url_small => "Image Url Small",
        :image_url_medium => "Image Url Medium",
        :gender => "Gender",
        :bio => "MyText",
        :searchable => false,
        :user_id => "",
        :location => "Location",
        :full_name => "Full Name",
        :nsfw => false
      ),
      stub_model(Profile,
        :first_name => "First Name",
        :last_name => "Last Name",
        :image_url => "Image Url",
        :image_url_small => "Image Url Small",
        :image_url_medium => "Image Url Medium",
        :gender => "Gender",
        :bio => "MyText",
        :searchable => false,
        :user_id => "",
        :location => "Location",
        :full_name => "Full Name",
        :nsfw => false
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url Small".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url Medium".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
