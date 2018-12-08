class Sfa < ApplicationRecord
	has_many :comments
	
	validates :company, presence: true
	validates :owner, presence: true
	validates :tel, presence: true
	validates :address, presence: true
	
	def self.import(file)
		CSV.foreach(file.path, headers:true)do |row|
		sfa = find_by(id: row["id"]) || new
		sfa.attributes = row.to_hash.slice(*updatable_attributes)
		sfa.save!
	  end
	end
	
	def self.updatable_attributes
   		["company", "store", "owner", "kana", "person", "p_kana","tel", "tel2", "fax", "industry", "mail", "url", "people", "post_number", "address", "employment", "social", "appointer", "sales_staff", "sales_day", "status", "target", "sales_forecast", "impression", "repeat_sales", "next_sales", "ditails", "examination"]
   	end
   	
   	
   	def next_sfa
    	Sfa.where("id > ?", id).first
   	end
   	
   	def prev_sfa
    	Sfa.where("id < ?", id).last
   	end	    
end
