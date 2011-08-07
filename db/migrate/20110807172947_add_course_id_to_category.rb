class AddCourseIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :course_id, :integer
  end
end
