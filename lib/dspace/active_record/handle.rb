class Handle < ActiveRecord::Base
  set_table_name "handle"
  has_many :communities,
    :class_name => "Community",
    :foreign_key => "resource_id",
    :conditions => "resource_type_id = 4"
    
  def to_s
    self.handle
  end
end
