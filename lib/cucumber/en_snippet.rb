require "cucumber/en_snippet/version"

module Cucumber
  class EnBaseSnippet < RbSupport::Snippet::BaseSnippet
    def initialize(code_keyword, pattern, multiline_argument_class)
      keyword = en_keyword(code_keyword)
      keyword = code_keyword if keyword.empty?

      super(keyword, pattern, multiline_argument_class)
    end

    private

    def en_keyword(code_keyword)
      %i(given when then).find {|k|
        ::Regexp.new(::Gherkin::I18n.keyword_regexp(k)) =~ code_keyword
      }.to_s.capitalize
    end
  end

  class EnRegexp < EnBaseSnippet
    def typed_pattern
      "(/^#{pattern}$/)"
    end

    def self.description
      'Snippets with parentheses (English keywords)'
    end
  end
end

Cucumber::RbSupport::RbLanguage::SNIPPET_TYPES.merge!(
  en_regexp: Cucumber::EnRegexp
)
