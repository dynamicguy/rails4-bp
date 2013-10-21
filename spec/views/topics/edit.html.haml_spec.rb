require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :topic_id => 1,
      :topic_type => "MyString",
      :topic_title => "MyString",
      :topic_status => false,
      :topic_toc => false,
      :toc_name => "MyString",
      :topic_index => false,
      :index_name => "MyString",
      :topic_permalink => "MyString",
      :topic_content => "MyText",
      :prj_id => 1,
      :folder_id => 1,
      :deleted => "MyString",
      :created_time => 1,
      :created_uid => "MyString",
      :modified_time => 1,
      :modified_uid => 1,
      :deleted_time => 1,
      :deleted_uid => 1,
      :undeleted_uid => 1,
      :undeleted_time => 1,
      :comp_id => 1,
      :topic_size => 1,
      :has_feedback => false,
      :good => 1,
      :bad => 1,
      :show_in_pdf => false,
      :import_id => "MyString",
      :duplicated_id => 1,
      :toc_hidden => false,
      :keywords => "MyString",
      :inc_search => false,
      :working => false,
      :toc_open => false
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
      assert_select "input#topic_topic_id[name=?]", "topic[topic_id]"
      assert_select "input#topic_topic_type[name=?]", "topic[topic_type]"
      assert_select "input#topic_topic_title[name=?]", "topic[topic_title]"
      assert_select "input#topic_topic_status[name=?]", "topic[topic_status]"
      assert_select "input#topic_topic_toc[name=?]", "topic[topic_toc]"
      assert_select "input#topic_toc_name[name=?]", "topic[toc_name]"
      assert_select "input#topic_topic_index[name=?]", "topic[topic_index]"
      assert_select "input#topic_index_name[name=?]", "topic[index_name]"
      assert_select "input#topic_topic_permalink[name=?]", "topic[topic_permalink]"
      assert_select "textarea#topic_topic_content[name=?]", "topic[topic_content]"
      assert_select "input#topic_prj_id[name=?]", "topic[prj_id]"
      assert_select "input#topic_folder_id[name=?]", "topic[folder_id]"
      assert_select "input#topic_deleted[name=?]", "topic[deleted]"
      assert_select "input#topic_created_time[name=?]", "topic[created_time]"
      assert_select "input#topic_created_uid[name=?]", "topic[created_uid]"
      assert_select "input#topic_modified_time[name=?]", "topic[modified_time]"
      assert_select "input#topic_modified_uid[name=?]", "topic[modified_uid]"
      assert_select "input#topic_deleted_time[name=?]", "topic[deleted_time]"
      assert_select "input#topic_deleted_uid[name=?]", "topic[deleted_uid]"
      assert_select "input#topic_undeleted_uid[name=?]", "topic[undeleted_uid]"
      assert_select "input#topic_undeleted_time[name=?]", "topic[undeleted_time]"
      assert_select "input#topic_comp_id[name=?]", "topic[comp_id]"
      assert_select "input#topic_topic_size[name=?]", "topic[topic_size]"
      assert_select "input#topic_has_feedback[name=?]", "topic[has_feedback]"
      assert_select "input#topic_good[name=?]", "topic[good]"
      assert_select "input#topic_bad[name=?]", "topic[bad]"
      assert_select "input#topic_show_in_pdf[name=?]", "topic[show_in_pdf]"
      assert_select "input#topic_import_id[name=?]", "topic[import_id]"
      assert_select "input#topic_duplicated_id[name=?]", "topic[duplicated_id]"
      assert_select "input#topic_toc_hidden[name=?]", "topic[toc_hidden]"
      assert_select "input#topic_keywords[name=?]", "topic[keywords]"
      assert_select "input#topic_inc_search[name=?]", "topic[inc_search]"
      assert_select "input#topic_working[name=?]", "topic[working]"
      assert_select "input#topic_toc_open[name=?]", "topic[toc_open]"
    end
  end
end
