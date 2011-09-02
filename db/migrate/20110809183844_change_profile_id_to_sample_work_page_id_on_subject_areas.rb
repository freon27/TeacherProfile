class ChangeProfileIdToSampleWorkPageIdOnSubjectAreas < ActiveRecord::Migration
  def self.up
    rename_column :subject_areas, :profile_id, :sample_work_page_id
  end

  def self.down
    rename_column :subject_areas, :sample_work_page_id, :profile_id
  end
end
