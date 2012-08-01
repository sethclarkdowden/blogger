class Article < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list
   has_many :comments

   has_many :taggings	# declares the relationship Article has wit hTaggings each artical can have many taggins
   has_many :tags, :through => :taggings #declare that Article has many tags though the relationship with taggins. taggins shows the relationship

 	def tag_list
	  return self.tags.join(", ")
  end
# def tag_list and def tag_list=(tags_string) do not conflict becus you can not tall tag_list with a paramiter and you cant call tag_list=(tags_string) withough passing a string paramiter
   def tag_list=(tags_string)
   	self.taggings.destroy_all #this enitalizes the taggins so when we edit the tags and poot in diffrent tags we do not have duplicat tags eg: old tags + the new edited tags

   	tag_names = tags_string.split(", ").collect { |tag| tag.downcase }.uniq #splits up tag_names in to diffrent strings and makes them all lower case and olny alows uniq non duplicit tags

   	tag_names.each do |tag_name|
   		tag = Tag.find_or_create_by_name(tag_name)
   		tagging = self.taggings.new
   		tagging.tag_id = tag.id
   	end
  end
end
