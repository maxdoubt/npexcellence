class AddBannerToSettings < ActiveRecord::Migration
  def up
    add_attachment :settings, :banner
  end

  def down
    remove_attachment :settings, :banner
  end
end
