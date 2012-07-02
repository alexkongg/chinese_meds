class Tcm < ActiveRecord::Base
  before_save :render_body
  attr_accessible :content, :title, :rendered_content, :book
  has_permalink 

  
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :book, presence: true, length: { maximum: 140 }
  
  default_scope order: 'tcms.title'
  

  
  
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
    end
    
    class PygmentizeHTML < Redcarpet::Render::HTML
      def block_code(code, language)
        require 'pygmentize'
        Pygmentize.process(code, language)
      end
    end
end
