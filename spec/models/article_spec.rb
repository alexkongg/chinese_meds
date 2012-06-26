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

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
