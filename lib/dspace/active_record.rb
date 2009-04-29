# Far, far from a complete ActiveRecord configuration for DSpace.

require 'active_record'

# Override the save methods because I don't want to 
# accidentally overwrite something in the DSpace DB.
class ActiveRecord::Base
  def save
    false
  end
  def save!
    false
  end
end
ActiveRecord::Base.primary_key_prefix_type = :table_name_with_underscore

Dir.glob(File.join(File.dirname(__FILE__), 'active_record', '*.rb')).each {|f| require f }