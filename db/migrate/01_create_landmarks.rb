class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'
  create_table :landmarks do |t|
    t.string :name
    t.integer :year_completed
    t.integer :figure_id
  end
end
