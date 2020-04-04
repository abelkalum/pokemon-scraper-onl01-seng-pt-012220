class Pokemon
  
  def initialize(id=nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def save
   if !@id
      sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
   else
      sql = "UPDATE students SET name = ? WHERE id = ?"
      DB[:conn].execute(sql, @name, @id)
   end
  end
  
  def find
    
  end
    
end
