# == Schema Information
#
# Table name: articles
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Article < ActiveRecord::Base
  attr_accessible :content, :description, :title
end
