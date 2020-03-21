class CreateBios < ActiveRecord::Migration[5.2]
  def change
    create_table :bios do |t|
      t.text :Bio

      t.timestamps
    end
  end
end
