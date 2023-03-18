# frozen_string_literal: true

# Development
if Rails.env.development?
  # Create Admin Users

  AdminUser.create!(email: 'kris.d.litman@gmail.com', password: 'password', password_confirmation: 'password')
  AdminUser.create!(email: '', password: '', password_confirmation: '')
  AdminUser.create!(email: '', password: '', password_confirmation: '')
  AdminUser.create!(email: '', password: '', password_confirmation: '')

  # Create Players

  100.times do
    FactoryBot.create :player
  end

  # Create Guest Players

  200.times do
    FactoryBot.create :player, :guest
  end
end
