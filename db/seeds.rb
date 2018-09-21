# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'yaml'
require "active_support/core_ext/hash/indifferent_access"

hash = YAML.load_file('seeds.yml').with_indifferent_access
def createconfig(name1,arg1)
  return { name1 => arg1}
end

curentproject = nil
projects = hash[:projects]
projects.each_entry{|entry| 
 entry.each_key{ |key1| 
   if key1!="todos"
      #puts entry[key1]
     project_name = entry[key1]
     config = createconfig(key1,entry[key1])#преобразуем в хеш
     curentproject = Project.create(config)
   end
    if key1=="todos"
      todos1 = entry[key1]
      todos1.each_entry{|todohash| #пробегаем по каждому todo
          curentproject.todos.create(todohash)        
          }
    end
    }
  }