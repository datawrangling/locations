class Location < ActiveRecord::Base
    named_scope :name_like, lambda { |query| { :conditions => ['name like ? ', "#{query}%"], :order => '`population` DESC', :limit => 12 } }
end
