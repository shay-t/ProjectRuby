class Materiel
    attr_reader :id ,:dispo
    @@id1=0
    def initialize()
        @id=@@id1+1
        @@id1+=1
        @dispo=true
    end
    def to_s 
        puts "Matériel N°: #{@id} - disponibilite #{@dispo}"
    end
    ######## materiel dispo
    def isAvailable?
        if !@dispo
            raise(MaterielIndisponible,"*materiel deja emprunté")
        end
    end
    def setDispo(state)
        @dispo = state
    end
    #retourne un materiel coresspond a un id
    #retourne l'ensemble des id des Materiels
end
class OrdinateurPortable < Materiel
    attr_reader :marque
    def initialize(marque)
        super()
        @marque=marque
    end
    def to_s 
        puts "Matériel N°: #{@id} - marque #{@marque} - disponibilite #{@dispo}"
    end
    
end