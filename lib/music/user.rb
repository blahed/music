module Music
  class User
    attr_reader :id, :name

    def initialize(user)
      @id   = user[:id]
      @name = user[:name]
    end

    def to_h
      {
        id: @id,
        name: @name
      }
    end
  end
end
