class Collection < ActiveRecord::Base
  set_table_name "collection"
  has_and_belongs_to_many :items,
    :class_name => "Item",
    :join_table => "collection2item",
    :association_foreign_key => "item_id",
    :foreign_key => "collection_id"
    
  has_and_belongs_to_many :parent_community,
    :class_name => "Community",
    :join_table => "community2collection",
    :association_foreign_key => "community_id",
    :foreign_key => "collection_id"
    
  has_many :items,
    :class_name => "Item",
    :foreign_key => "owning_collection"
    
  has_one :handle,
    :class_name => "Handle",
    :foreign_key => "resource_id",
    :conditions => "resource_type_id = 3"
end