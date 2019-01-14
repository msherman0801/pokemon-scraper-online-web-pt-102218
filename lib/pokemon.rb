class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(pokemon, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", pokemon, type)
    end

    def self.find(id, db)
       out = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
       self.new(id:out[0],name:out[1],type:out[2], db:db)
    end
end
