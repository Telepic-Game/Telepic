# frozen_string_literal: true

ActiveAdmin.register Player do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
                :username

  scope :active
  scope :guest

  action_item :guest, only: :show do
    link_to 'Update to Player', guest_admin_player_path(player), method: :put if player.guest
  end

  member_action :guest, method: :put do
    player = Player.find(params[:id])

    player.update(guest: false)
    redirect_to admin_player_path(player)
  end
end
