Feature: Snippets

  Cucumber helpfully prints out any undefined step definitions as a code
  snippet suggestion, which you can then paste into a step definitions
  file of your choosing.

  Background:
    Given a file named "features/support/env.rb" with:
      """
        require 'cucumber/en_snippet'
      """

  Scenario: Snippet for undefined step with a pystring
    Given a file named "features/undefined_steps.feature" with:
      """
      # language: ja
      フィーチャ:
      シナリオ: pystring
        前提 a pystring
        \"\"\"
          example with <html> entities
        \"\"\"
      """
    When I run `cucumber features/undefined_steps.feature -s -I en_regexp`
    Then the output should contain:
      """
      Given(/^a pystring$/) do |string|
        pending # express the regexp above with the code you wish you had
      end
      """

  Scenario: Snippet for undefined step with a step table
    Given a file named "features/undefined_steps.feature" with:
      """
      # language: ja
      フィーチャ:
      シナリオ: table
        前提 a table
          | table |
          |example|
      """
    When I run `cucumber features/undefined_steps.feature -s -I en_regexp`
    Then the output should contain:
      """
      Given(/^a table$/) do |table|
        # table is a Cucumber::Ast::Table
        pending # express the regexp above with the code you wish you had
      end
      """
