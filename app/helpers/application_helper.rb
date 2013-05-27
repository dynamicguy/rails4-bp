module ApplicationHelper

  module ApplicationHelper
    def head
      render :partial => 'layouts/head'
    end

    def scripts
      render :partial => 'layouts/scripts'
    end

    def chromeframe
      render :partial => 'layouts/chromeframe'
    end
  end


  def setup_search_form(builder)
    fields = builder.grouping_fields builder.object.new_grouping, object_name: 'new_object_name', child_index: "new_grouping" do |f|
      render('grouping_fields', f: f)
    end
    content_for :document_ready, %Q{
      var search = new Search({grouping: "#{escape_javascript(fields)}"});
      $('button.add_fields').click(function() {
        search.add_fields(this, $(this).data('fieldType'), $(this).data('content'));
        return false;
      });
      $('button.remove_fields').click(function() {
        search.remove_fields(this);
        return false;
      });
      $('button.nest_fields').click(function() {
        search.nest_fields(this, $(this).data('fieldType'));
        return false;
      });
    }.html_safe
  end

  def button_to_remove_fields(name, f)
    content_tag :button, name, class: 'remove_fields btn btn-danger'
  end

  def button_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: "new_#{type}") do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    content_tag :button, name, :class => 'add_fields btn', 'data-field-type' => type, 'data-content' => "#{fields}"
  end

  def button_to_nest_fields(name, type)
    content_tag :button, name, :class => 'nest_fields btn', 'data-field-type' => type
  end
end
