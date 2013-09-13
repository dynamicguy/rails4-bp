module ApplicationHelper

  def pod_name
    AppConfig.settings.pod_name.present? ? AppConfig.settings.pod_name : "rails4bp*"
  end

  def pod_version
    AppConfig.version.number.present? ? AppConfig.version.number : ""
  end

  def changelog_url
    url = "https://github.com/rails4bp/rails4bp/blob/master/Changelog.md"
    url.sub!('/master/', "/#{AppConfig.git_revision}/") if AppConfig.git_revision.present?
    url
  end

  def how_long_ago(obj)
    timeago(obj.created_at)
  end

  def timeago(time, options={})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.iso8601)) if time
  end

  def bookmarklet
    raw_bookmarklet
  end

  def raw_bookmarklet(height = 250, width = 620)
    "javascript:(function(){f='#{AppConfig.pod_uri.to_s}bookmarklet?url='+encodeURIComponent(window.location.href)+'&title='+encodeURIComponent(document.title)+'&notes='+encodeURIComponent(''+(window.getSelection?window.getSelection():document.getSelection?document.getSelection():document.selection.createRange().text))+'&v=1&';a=function(){if(!window.open(f+'noui=1&jump=doclose','rails4bpv1','location=yes,links=no,scrollbars=no,toolbar=no,width=#{width},height=#{height}'))location.href=f+'jump=yes'};if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})()"
  end

  def magic_bookmarklet_link
    bookmarklet
  end

  def contacts_link
    if current_user.contacts.size > 0
      contacts_path
    else
      community_spotlight_path
    end
  end

  def all_services_connected?
    current_user.services.size == AppConfig.configured_services.size
  end

  def popover_with_close_html(without_close_html)
    without_close_html + link_to(content_tag(:div, nil, :class => 'icons-deletelabel'), "#", :class => 'close')
  end

  # Require jQuery from CDN if possible, falling back to vendored copy, and require
  # vendored jquery_ujs
  def jquery_include_tag
    buf = []
    if AppConfig.privacy.jquery_cdn?
      version = Jquery::Rails::JQUERY_VERSION
      buf << [javascript_include_tag("//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js")]
      buf << [javascript_tag("!window.jQuery && document.write(unescape('#{j javascript_include_tag("jquery")}'));")]
    else
      buf << [javascript_include_tag('jquery')]
    end
    buf << [javascript_include_tag('jquery_ujs')]
    buf << [javascript_tag("jQuery.ajaxSetup({'cache': false});")]
    buf << [javascript_tag("$.fx.off = true;")] if Rails.env.test?
    buf.join("\n").html_safe
  end

  def head
    render :partial => 'layouts/head'
  end

  def scripts
    render :partial => 'layouts/scripts'
  end

  def chromeframe
    render :partial => 'layouts/chromeframe'
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
