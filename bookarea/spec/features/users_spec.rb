require 'rails_helper'
describe 'User System' do
  
  it 'allows to register a user, log in', js: true do
    visit root_path
    # click_on I18n.t('Forms.sign_up')
    # fill_in I18n.t('Forms.Username'), with: 'test_user'
    # fill_in I18n.t('Forms.Email'), with: 'test@example.org'
    # fill_in I18n.t('Forms.Password'), with: 'password'
    # fill_in I18n.t('Forms.Confirm password'), with: 'password'
    # click_on I18n.t('Forms.submit')
    click_on 'Зарегистрироваться'
    fill_in 'Имя пользователя', with: 'test_user'
    fill_in 'Почта', with: 'test@example.org'
    fill_in 'Пароль', with: 'password'
    fill_in 'Введите пароль еще раз', with: 'password'
    click_on 'Подтвердить'
    expect(User.find_by(username: 'test_user')).not_to be_nil
    # expect(page.body).to include "#{I18n.t('navbars.Logged in as')} test user"
    expect(page.body).to include 'test_user'
  end

  it 'doesn\'t allow to calculate unless logged in', js: true do
    visit books_path
    expect(page.body).not_to include 'Name'
    expect(page.body).not_to include 'Sign out'
  end
end