class Sfa < ApplicationRecord
	    has_many :comments
	    
	def self.import(file)
		CSV.foreach(file.path, headers:true)do |row|
		sfa = find_by(id: row["id"]) || new
		sfa.attributes = row.to_hash.slice(*updatable_attributes)
		sfa.save!
	  end
	end
	
	def self.updatable_attributes
   		["company", "owner", "tel", "address"]
   	end
   	
   	def self.search(search)
   		if search
   			Sfa.where(['company LIKE ?', "%#{company}%"])
   		else
   			Sfa.all
   		end
   	end
   	
   	def next_sfa
    	Sfa.where("id > ?", id).first
   	end
   	
   	def prev_sfa
    	Sfa.where("id < ?", id).last
   	end	    
end
