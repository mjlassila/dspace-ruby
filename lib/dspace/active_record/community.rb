class Community < ActiveRecord::Base
  set_table_name "community"
  has_and_belongs_to_many :items,
    :class_name => "Item",
    :join_table => "community2item",
    :association_foreign_key => "item_id",
    :foreign_key => "community_id"
    
  has_and_belongs_to_many :sub_communities,
    :class_name => "Community",
    :join_table => "community2community",
    :association_foreign_key => "child_comm_id",
    :foreign_key => "parent_comm_id"
    
  has_and_belongs_to_many :parent_community,
    :class_name => "Community",
    :join_table => "community2community",
    :association_foreign_key => "parent_comm_id",
    :foreign_key => "child_comm_id"

  has_one :handle,
    :class_name => "Handle",
    :foreign_key => "resource_id",
    :conditions => "resource_type_id = 4"
    
  def self.find_all_top_level
    Community.find_by_sql("SELECT community.* FROM community WHERE community_id NOT IN (SELECT child_comm_id FROM community2community)")
  end
  
  def self.find_all_sub_communities
    Community.find_by_sql("SELECT community.* FROM community WHERE community_id IN (SELECT child_comm_id FROM community2community)")
  end
end