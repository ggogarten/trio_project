class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first
      t.string :last
      t.string :full

      t.timestamps null: false
    end
  end
end
