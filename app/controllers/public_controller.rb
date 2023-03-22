# frozen_string_literal: true

class PublicController < ApplicationController
  def index; end

  def about; end

  def terms; end

  def random
    @card = ScryfallService.random
    @magic_symbols = magic_symbols
  end

  def construction; end

  private

  def magic_symbols
    base_url = 'https://www.smfcorp.net/images/grosmanas/%%7B%s%%7D.png'
    symbols = %w[R W U B G C X Y Z T] + (0..20).map(&:to_s)
    symbols.map { |symbol| [format('{%s}', symbol), format(base_url, symbol)] }.to_h
  end
end
