require "cucumber/en_snippet/version"

require "cucumber/rb_support/snippet"

module Cucumber
  module EnSnippet
    # Your code goes here...
  end
end

module Cucumber
  module RbSupport
    module Snippet
      class BaseSnippet
        def initialize_with_en_keyword(code_keyword, pattern, multiline_argument_class)
          case
          when ::Regexp.new(Gherkin::I18n.keyword_regexp(:given)) =~ code_keyword
            en_keyword = 'Given'
          when ::Regexp.new(Gherkin::I18n.keyword_regexp(:when)) =~ code_keyword
            en_keyword = 'When'
          when ::Regexp.new(Gherkin::I18n.keyword_regexp(:then)) =~ code_keyword
            en_keyword = 'Then'
          else
            en_keyword = code_keyword
          end

          initialize_without_en_keyword(en_keyword, pattern, multiline_argument_class)
        end

        alias_method :initialize_without_en_keyword, :initialize
        alias_method :initialize, :initialize_with_en_keyword
      end
    end
  end
end
