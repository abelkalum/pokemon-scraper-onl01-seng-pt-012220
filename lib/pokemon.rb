class Pokemon
  attr_reader :id, :name, :type, :db
  @@all = []

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end
  
  def save
   if !@id
      sql = <<-SQL
        INSERT INTO pokemons (name, type, db)
        VALUES (?, ?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.type, self.db)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
   else
      sql = "UPDATE pokemons SET name = ? WHERE id = ? db = ?"
      DB[:conn].execute(sql, @name, @id, @db)
   end
  end
  
  def find
    
  end
    
end
