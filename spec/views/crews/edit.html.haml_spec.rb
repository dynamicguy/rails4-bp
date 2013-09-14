require 'spec_helper'

describe "crews/edit" do
  before(:each) do
    @crew = assign(:crew, stub_model(Crew,
      :age => 1,
      :name => "MyString",
      :avatar => "MyString",
      :title => "MyString",
      :species => "MyString",
      :origin => "MyString",
      :quote => "MyString"
    ))
  end

  it "renders the edit crew form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crew_path(@crew), "post" do
      assert_select "input#crew_age[name=?]", "crew[age]"
      assert_select "input#crew_name[name=?]", "crew[name]"
      assert_select "input#crew_avatar[name=?]", "crew[avatar]"
      assert_select "input#crew_title[name=?]", "crew[title]"
      assert_select "input#crew_species[name=?]", "crew[species]"
      assert_select "input#crew_origin[name=?]", "crew[origin]"
      assert_select "input#crew_quote[name=?]", "crew[quote]"
    end
  end
end
