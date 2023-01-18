# frozen_string_literal: true

class PublicController < ApplicationController
  def index; end

  def about; end

  def terms; end

  def random
    @card = ScryfallService.random
  end

  def construction; end
end
