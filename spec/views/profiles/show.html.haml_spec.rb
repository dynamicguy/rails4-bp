require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Image Url/)
    rendered.should match(/Image Url Small/)
    rendered.should match(/Image Url Medium/)
    rendered.should match(/Gender/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(//)
    rendered.should match(/Location/)
    rendered.should match(/Full Name/)
    rendered.should match(/false/)
  end
end
