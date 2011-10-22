class AddIndices < ActiveRecord::Migration
  def self.up

    add_index :profiles, :main_page_id
    add_index :profiles, :philosophy_page_id
    add_index :profiles, :experience_page_id
    add_index :profiles, :sample_work_page_id
    add_index :profiles, :user_id
    add_index :profiles, :url_suffix
    
    add_index :subject_areas, :sample_work_page_id
    add_index :subject_areas, :user_id
        
    add_index :projects, :subject_area_id
    add_index :projects, :user_id
        
    add_index :documents, :project_id
    add_index :documents, :user_id
    
    add_index :photos, :project_id
    add_index :photos, :user_id
    
    add_index :subjects, :qualification_id
    add_index :subjects, :user_id
    
    add_index :qualifications, :experience_page_id
    add_index :qualifications, :user_id
    
    add_index :positions, :experience_page_id
    add_index :positions, :user_id
    
    add_index :main_pages, :user_id
    add_index :experience_pages, :user_id
    add_index :philosophy_pages, :user_id
    add_index :sample_work_pages, :user_id
  end

  def self.down

    remove_index :profiles, :main_page_id
    remove_index :profiles, :philosophy_page_id
    remove_index :profiles, :experience_page_id
    remove_index :profiles, :sample_work_page_id
    remove_index :profiles, :user_id
    remove_index :profiles, :url_suffix
    
    remove_index :subject_areas, :sample_work_page_id
    remove_index :subject_areas, :user_id
        
    remove_index :projects, :subject_area_id
    remove_index :projects, :user_id
        
    remove_index :documents, :project_id
    remove_index :documents, :user_id
    
    remove_index :photos, :project_id
    remove_index :photos, :user_id
    
    remove_index :subjects, :qualification_id
    remove_index :subjects, :user_id
    
    remove_index :qualifications, :experience_page_id
    remove_index :qualifications, :user_id
    
    remove_index :positions, :experience_page_id
    remove_index :positions, :user_id
    
    remove_index :main_pages, :user_id
    remove_index :experience_pages, :user_id
    remove_index :philosophy_pages, :user_id
    remove_index :sample_work_pages, :user_id
  end
end