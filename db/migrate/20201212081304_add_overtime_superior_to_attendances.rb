class AddOvertimeSuperiorToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_superior, :integer
  end
end
