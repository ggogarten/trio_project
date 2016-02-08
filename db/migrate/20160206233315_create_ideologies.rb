class CreateIdeologies < ActiveRecord::Migration
  def change
    create_table :ideologies do |t|
      t.string :concept
      t.float :relevance
      t.references :speech, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
