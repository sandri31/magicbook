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
    {
      '{R}' => 'https://www.smfcorp.net/images/grosmanas/%7BR%7D.png',
      '{W}' => 'https://www.smfcorp.net/images/grosmanas/%7BW%7D.png',
      '{U}' => 'https://www.smfcorp.net/images/grosmanas/%7BU%7D.png',
      '{B}' => 'https://www.smfcorp.net/images/grosmanas/%7BB%7D.png',
      '{G}' => 'https://www.smfcorp.net/images/grosmanas/%7BG%7D.png',
      '{C}' => 'https://www.smfcorp.net/images/grosmanas/%7BC%7D.png',
      '{X}' => 'https://www.smfcorp.net/images/grosmanas/%7BX%7D.png',
      '{Y}' => 'https://www.smfcorp.net/images/grosmanas/%7BY%7D.png',
      '{Z}' => 'https://www.smfcorp.net/images/grosmanas/%7BZ%7D.png',
      '{0}' => 'https://www.smfcorp.net/images/grosmanas/%7B0%7D.png',
      '{1}' => 'https://www.smfcorp.net/images/grosmanas/%7B1%7D.png',
      '{2}' => 'https://www.smfcorp.net/images/grosmanas/%7B2%7D.png',
      '{3}' => 'https://www.smfcorp.net/images/grosmanas/%7B3%7D.png',
      '{4}' => 'https://www.smfcorp.net/images/grosmanas/%7B4%7D.png',
      '{5}' => 'https://www.smfcorp.net/images/grosmanas/%7B5%7D.png',
      '{6}' => 'https://www.smfcorp.net/images/grosmanas/%7B6%7D.png',
      '{7}' => 'https://www.smfcorp.net/images/grosmanas/%7B7%7D.png',
      '{8}' => 'https://www.smfcorp.net/images/grosmanas/%7B8%7D.png',
      '{9}' => 'https://www.smfcorp.net/images/grosmanas/%7B9%7D.png',
      '{10}' => 'https://www.smfcorp.net/images/grosmanas/%7B10%7D.png',
      '{11}' => 'https://www.smfcorp.net/images/grosmanas/%7B11%7D.png',
      '{12}' => 'https://www.smfcorp.net/images/grosmanas/%7B12%7D.png',
      '{13}' => 'https://www.smfcorp.net/images/grosmanas/%7B13%7D.png',
      '{14}' => 'https://www.smfcorp.net/images/grosmanas/%7B14%7D.png',
      '{15}' => 'https://www.smfcorp.net/images/grosmanas/%7B15%7D.png',
      '{16}' => 'https://www.smfcorp.net/images/grosmanas/%7B16%7D.png',
      '{17}' => 'https://www.smfcorp.net/images/grosmanas/%7B17%7D.png',
      '{18}' => 'https://www.smfcorp.net/images/grosmanas/%7B18%7D.png',
      '{19}' => 'https://www.smfcorp.net/images/grosmanas/%7B19%7D.png',
      '{20}' => 'https://www.smfcorp.net/images/grosmanas/%7B20%7D.png',
      '{T}' => 'https://www.smfcorp.net/images/grosmanas/%7BT%7D.png'
      # Add other symbols and their images here
    }
  end
end
