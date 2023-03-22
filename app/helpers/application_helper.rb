# frozen_string_literal: true

module ApplicationHelper
  def replace_magic_symbols(text, magic_symbols)
    magic_symbols.each do |symbol, image|
      text = text.gsub(symbol, ActionController::Base.helpers.image_tag(image, class: 'magic-symbol'))
    end

    text.html_safe
  end
end
