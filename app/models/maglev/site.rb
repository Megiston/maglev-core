# frozen_string_literal: true

module Maglev
  class Site < ApplicationRecord

    after_initialize :initialize_default_json, :if => :new_record?

    
    ## concerns ##
    include Maglev::Site::LocalesConcern
    include Maglev::SectionsConcern
    include Maglev::Translatable


    def initialize_default_json
      self.sections_translations ||= {}
      self.locales ||= []
    end

    ## translations ##
    translates :sections

    ## validations ##
    validates :name, presence: true

    ## methods ##
    def api_attributes
      %i[id name]
    end

    def find_section(type)
      sections&.find { |section| section['type'] == type }
    end

    def translate_in(locale, source_locale)
      translate_attr_in(:sections, locale, source_locale)
    end
  end
end

# == Schema Information
#
# Table name: maglev_sites
#
#  id                    :bigint           not null, primary key
#  domain                :string
#  handle                :string
#  locales               :json
#  lock_version          :integer
#  name                  :string
#  navigation            :json
#  sections_translations :json
#  siteable_type         :string
#  style                 :json
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  siteable_id           :bigint
#  theme_id              :string
#
# Indexes
#
#  index_maglev_sites_on_siteable  (siteable_type,siteable_id)
#
