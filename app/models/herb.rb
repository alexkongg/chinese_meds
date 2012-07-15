# == Schema Information
#
# Table name: herbs
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Herb < ActiveRecord::Base
  before_save :render_body
  attr_accessible :content, :description, :title, :rendered_description, :rendered_content, :ailment
  has_permalink 

  self.per_page = 10
  
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :description, presence: true, length: { maximum: 400 }
  
  default_scope order: 'herbs.title'
  

  
  
  private
  
    def render_body
      require 'redcarpet'
      renderer = PygmentizeHTML
      extensions = {hard_wrap: true, filter_html: true, autolink: true, 
                    no_intra_emphasis: true, fenced_code_blocks: true,
                    strikethrough: true, tables: true, superscript: true,
                    with_toc_data: true}
      redcarpet = Redcarpet::Markdown.new(renderer, extensions)
      self.rendered_content = redcarpet.render self.content
      self.rendered_description = redcarpet.render self.description
    end
    
    class PygmentizeHTML < Redcarpet::Render::HTML
      def block_code(code, language)
        require 'pygmentize'
        Pygmentize.process(code, language)
      end
    end
end
