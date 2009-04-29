class Item < ActiveRecord::Base
  set_table_name "item"

  has_and_belongs_to_many :community,
    :class_name => "Community",
    :join_table => "communities2item",
    :association_foreign_key => "community_id",
    :foreign_key => "item_id"

  has_and_belongs_to_many :communities,
    :class_name => "Community",
    :join_table => "communities2item",
    :association_foreign_key => "community_id",
    :foreign_key => "item_id" do
      def top_level
        find :first, :order => "id DESC"
      end
    end
    
  belongs_to :collection,
    :class_name => "Collection",
    :foreign_key => "owning_collection"
end