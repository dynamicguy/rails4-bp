require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :topic_id => 1,
      :topic_type => "Topic Type",
      :topic_title => "Topic Title",
      :topic_status => false,
      :topic_toc => false,
      :toc_name => "Toc Name",
      :topic_index => false,
      :index_name => "Index Name",
      :topic_permalink => "Topic Permalink",
      :topic_content => "MyText",
      :prj_id => 2,
      :folder_id => 3,
      :deleted => "Deleted",
      :created_time => 4,
      :created_uid => "Created Uid",
      :modified_time => 5,
      :modified_uid => 6,
      :deleted_time => 7,
      :deleted_uid => 8,
      :undeleted_uid => 9,
      :undeleted_time => 10,
      :comp_id => 11,
      :topic_size => 12,
      :has_feedback => false,
      :good => 13,
      :bad => 14,
      :show_in_pdf => false,
      :import_id => "Import",
      :duplicated_id => 15,
      :toc_hidden => false,
      :keywords => "Keywords",
      :inc_search => false,
      :working => false,
      :toc_open => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Topic Type/)
    rendered.should match(/Topic Title/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Toc Name/)
    rendered.should match(/false/)
    rendered.should match(/Index Name/)
    rendered.should match(/Topic Permalink/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Deleted/)
    rendered.should match(/4/)
    rendered.should match(/Created Uid/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/false/)
    rendered.should match(/13/)
    rendered.should match(/14/)
    rendered.should match(/false/)
    rendered.should match(/Import/)
    rendered.should match(/15/)
    rendered.should match(/false/)
    rendered.should match(/Keywords/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
