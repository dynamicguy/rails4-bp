require 'spec_helper'

describe "crews/show" do
  before(:each) do
    @crew = assign(:crew, stub_model(Crew,
      :age => 1,
      :name => "Name",
      :avatar => "Avatar",
      :title => "Title",
      :species => "Species",
      :origin => "Origin",
      :quote => "Quote"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Avatar/)
    rendered.should match(/Title/)
    rendered.should match(/Species/)
    rendered.should match(/Origin/)
    rendered.should match(/Quote/)
  end
end
