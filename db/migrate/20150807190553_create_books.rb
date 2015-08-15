class CreateBooks < ActiveRecord::Migration
#   def change
#   end
  def up
    create_table :books do |t|
      t.string :title
      t.string :text
      t.string :author
      t.string :genre
      t.string :imagelink
      t.string :amazonlink
    end
  end
  
  def down
    drop_table :books
  end
end
