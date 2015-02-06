class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :summary
      t.string :twitter
      t.string :facebook
      t.timestamps null: false
    end
  end
end
