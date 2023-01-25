# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
