class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :name

      t.timestamps
    end
  end
end
