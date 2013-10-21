require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
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
      ),
      stub_model(Topic,
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
      )
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Topic Type".to_s, :count => 2
    assert_select "tr>td", :text => "Topic Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Toc Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Index Name".to_s, :count => 2
    assert_select "tr>td", :text => "Topic Permalink".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Deleted".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Created Uid".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Import".to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
