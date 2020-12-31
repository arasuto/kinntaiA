class AddBusinessProcessingContentToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :business_processing_content, :string
  end
end
