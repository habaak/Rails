class RemoveStringToIdentities < ActiveRecord::Migration
  def change
    remove_column :identities, :string
  end
end
