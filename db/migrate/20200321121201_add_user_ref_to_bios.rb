class AddUserRefToBios < ActiveRecord::Migration[5.2]
  def change
    add_reference :bios, :user, foreign_key: true
  end
end
