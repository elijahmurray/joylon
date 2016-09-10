class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.belongs_to :relationship, index: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
