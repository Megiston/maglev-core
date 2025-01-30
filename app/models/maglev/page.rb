# frozen_string_literal: true

module Maglev
  class Page < ApplicationRecord
    ## concerns ##

    after_initialize :initialize_default_json, :if => :new_record?


    include Maglev::Translatable
    include Maglev::SectionsConcern
    include Maglev::Page::PathConcern
    include Maglev::Page::SearchConcern

    def initialize_default_json
    self.sections_translations ||= {}
      self.title_translations ||= {}
      self.seo_title_translations ||= {}
      self.meta_description_translations ||= {}
      self.og_title_translations ||= {}
      self.og_description_translations ||= {}
      self.og_image_url_translations ||= {}
    end


    ## translations ##
    translates :title, presence: true
    translates :sections
    translates :seo_title, :meta_description
    translates :og_title, :og_description, :og_image_url

    ## scopes ##
    scope :home, ->(locale = nil) { by_path('index', locale) }
    scope :visible, -> { where(visible: true) }
    scope :by_id_or_path, lambda { |id_or_path, locale = nil|
                            joins(:paths).where(id: id_or_path).or(core_by_path(id_or_path, locale))
                          }
    scope :by_path, ->(path, locale = nil) { core_by_path(path, locale).joins(:paths) }
    scope :core_by_path, lambda { |path, locale = nil|
                           where(paths: { locale: locale || Maglev::I18n.current_locale, value: path })
                         }

    ## methods ##

    def index?
      path == 'index'
    end

    def static?
      false
    end

    def translate_in(locale, source_locale)
      %i[title sections seo_title meta_description og_title og_description og_image_url].each do |attr|
        translate_attr_in(attr, locale, source_locale)
      end
    end
  end
end

# == Schema Information
#
# Table name: maglev_pages
#
#  id                            :bigint           not null, primary key
#  lock_version                  :integer
#  meta_description_translations :json
#  og_description_translations   :json
#  og_image_url_translations     :json
#  og_title_translations         :json
#  sections_translations         :json
#  seo_title_translations        :json
#  title_translations            :json
#  visible                       :boolean          default(TRUE)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
