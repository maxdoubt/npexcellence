class AddVideoToOrgs < ActiveRecord::Migration
  def change
  	add_column :orgs, :youtube_id, :string
  end
end
