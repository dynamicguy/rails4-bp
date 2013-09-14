module Federated
  class Relayable < ActiveRecord::Base
    self.abstract_class = true

    #crazy ordering issues - DEATH TO ROXML
    include Rails4Bp::Federated::Base
    include Rails4Bp::Guid

    #seriously, don't try to move this shit around until you have killed ROXML
    xml_attr :target_type
    include Rails4Bp::Relayable

    xml_attr :rails4bp_handle

    belongs_to :target, :polymorphic => true
    belongs_to :author, :class_name => 'Person'
    #end crazy ordering issues

    validates_uniqueness_of :target_id, :scope => [:target_type, :author_id]
    validates :parent, :presence => true #should be in relayable (pending on fixing Message)

    def rails4bp_handle
      self.author.rails4bp_handle
    end

    def rails4bp_handle=(nh)
      self.author = Webfinger.new(nh).fetch
    end

    def parent_class
      self.target_type.constantize
    end

    def parent
      self.target
    end

    def parent= parent
      self.target = parent
    end
  end
end