# frozen_string_literal: true

# This is the base controller for the app
class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :authenticate
  before_action :set_current_user
  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    # locale = current_user.try(:locale) || I18n.default_locale
    # I18n.with_locale(locale, &action)
    logger.debug "* Accept-Language : #{request.env['HTTP_ACCEPT_LANGUANGE']}"
    locale = extract_locale_from_accept_language_header
    logger.debug "* Locale is set to '#{locale}'"
    I18n.with_locale(locale, &action)
  end

  def current_user
    User.find(session[:current_user_id])
  rescue StandardError
    nil
  end

  def set_current_user
    @current_user = current_user
  end

  private

  def authenticate
    redirect_to signin_path unless current_user
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
