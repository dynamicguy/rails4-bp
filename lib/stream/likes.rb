# Copyright (c) 2010-2011, Rails4Bp Inc. This file is
# licensed under the Affero General Public License version 3 or later. See
# the COPYRIGHT file.

class Stream::Likes < Stream::Base
  def link(opts={})
    Rails.application.routes.url_helpers.like_stream_path(opts)
  end

  def title
    I18n.translate("streams.like_stream.title")
  end

  # @return [ActiveRecord::Association<Post>] AR association of posts
  def posts
    @posts ||= EvilQuery::LikedPosts.new(user).posts
  end

  def contacts_title
    I18n.translate('streams.like_stream.contacts_title')
  end
end
