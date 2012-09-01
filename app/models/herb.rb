# == Schema Information
#
# Table name: herbs
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  physical_description :text
#  overview     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Herb < ActiveRecord::Base
  before_save :render_body
  attr_accessible :name, :overview, :physical_description,
                  :rendered_physical_description, :rendered_overview,
                  :chinese_name, :medicinal_description, :rendered_medicinal_description, :precautions, 
                  :rendered_precautions, :recent_studies, :rendered_recent_studies, :common_name,
                  :chemical_composition, :side_effects, :rendered_chemical_composition, :rendered_side_effects
  has_permalink :name

  self.per_page = 5
  
  validates :overview, presence: true
  validates :name, presence: true, length: { maximum: 140 }

  
  default_scope order: 'Herbs.name'

  searchable do 
    text :name, :boost => 20
    text :common_name, :boost => 20
    text :chinese_name, :boost => 20
    text :rendered_overview
    text :rendered_physical_description
    text :rendered_medicinal_description
    text :rendered_precautions
    text :rendered_side_effects
    text :rendered_recent_studies
    text :rendered_chemical_composition

    
   end
  
  private
  
    def render_body
      require 'redcarpet'
      renderer = PygmentizeHTML
      extensions = {hard_wrap: true, filter_html: true, autolink: true, 
                    no_intra_emphasis: true, fenced_code_blocks: true,
                    strikethrough: true, tables: true, superscript: true,
                    with_toc_data: true}
      redcarpet = Redcarpet::Markdown.new(renderer, extensions)
      self.rendered_overview = redcarpet.render self.overview
      self.rendered_physical_description = redcarpet.render self.physical_description
      self.rendered_medicinal_description = redcarpet.render self.medicinal_description
      self.rendered_precautions = redcarpet.render self.precautions
      self.rendered_recent_studies = redcarpet.render self.recent_studies
      self.rendered_side_effects = redcarpet.render self.side_effects
      self.rendered_chemical_composition = redcarpet.render self.chemical_composition
    end
    
    class PygmentizeHTML < Redcarpet::Render::HTML
      def block_code(code, language)
        require 'pygmentize'
        Pygmentize.process(code, language)
      end
    end
end
