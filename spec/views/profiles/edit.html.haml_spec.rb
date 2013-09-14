require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :first_name => "MyString",
      :last_name => "MyString",
      :image_url => "MyString",
      :image_url_small => "MyString",
      :image_url_medium => "MyString",
      :gender => "MyString",
      :bio => "MyText",
      :searchable => false,
      :user_id => "",
      :location => "MyString",
      :full_name => "MyString",
      :nsfw => false
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_first_name[name=?]", "profile[first_name]"
      assert_select "input#profile_last_name[name=?]", "profile[last_name]"
      assert_select "input#profile_image_url[name=?]", "profile[image_url]"
      assert_select "input#profile_image_url_small[name=?]", "profile[image_url_small]"
      assert_select "input#profile_image_url_medium[name=?]", "profile[image_url_medium]"
      assert_select "input#profile_gender[name=?]", "profile[gender]"
      assert_select "textarea#profile_bio[name=?]", "profile[bio]"
      assert_select "input#profile_searchable[name=?]", "profile[searchable]"
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_location[name=?]", "profile[location]"
      assert_select "input#profile_full_name[name=?]", "profile[full_name]"
      assert_select "input#profile_nsfw[name=?]", "profile[nsfw]"
    end
  end
end
