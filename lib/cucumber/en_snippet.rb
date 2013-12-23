require "cucumber/en_snippet/version"

require "cucumber/rb_support/snippet"

module Cucumber
  module RbSupport
    module Snippet
      class BaseSnippet
        def initialize_with_en_keyword(code_keyword, pattern, multiline_argument_class)
          keyword = en_keyword(code_keyword)
          keyword = code_keyword if keyword.empty?

          initialize_without_en_keyword(keyword, pattern, multiline_argument_class)
        end

        alias_method :initialize_without_en_keyword, :initialize
        alias_method :initialize, :initialize_with_en_keyword

        private

        def en_keyword(code_keyword)
          %i(given when then).find {|k|
            ::Regexp.new(::Gherkin::I18n.keyword_regexp(k)) =~ code_keyword
          }.to_s.capitalize
        end
      end
    end
  end
end
