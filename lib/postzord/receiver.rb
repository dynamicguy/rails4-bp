class Postzord::Receiver
  require 'postzord/receiver/private'
  require 'postzord/receiver/public'
  require 'postzord/receiver/local_batch'

  def perform!
    self.receive!
  end

  def author_does_not_match_xml_author?
    if (@author.rails4bp_handle != xml_author)
      FEDERATION_LOGGER.info("event=receive status=abort reason='author in xml does not match retrieved person' payload_type=#{@object.class} sender=#{@author.rails4bp_handle}")
      return true
    end
  end
end

