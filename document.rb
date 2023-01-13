class Document
    attr_reader :isbn,:titre,:dispo
    def initialize(isbn="Inconnu", titre="Inconnu")
        @isbn=isbn
        @titre=titre
        @dispo=true
    end
    def to_s 
        puts "Document ISBN°: #{@isbn} - Titre : #{@titre}"
    end
    #supprimer un document

    #retourne document grace ISBN| excepetion ISBN non connu
   
    #methode rechercherTitre(mot): retourne une collection contenant
    #des reference vers les documents qui comportent la chaîne mot dans leur titre.
    
end
#############################Livre####################
class Livre < Document
    attr_reader:auteurs
    def initialize(isbn,titre)
        super(isbn,titre)
        @auteurs=[]
    end
        #1-afficher les infos du livre Titre & ISBN
    def to_s 
        puts "Livre ISBN°: #{@isbn} - Titre : #{@titre}"
    end

    #ajout dun auteur a un livre
    def ajouter_auteur(auteur)
        @auteurs.push(auteur)
    end
    #Affichage des auteurs dun livre
    def id_aut()
    	@auteurs.each{ |at|
             puts "Auteurs : " 
             at.to_s
             }
	end
    ########livre dispo
    def isAvailable?
        if !@dispo
            raise(DocumentIndisponible,"*document deja emprunté")
        end
    end

    def setDispo(state)
        @dispo = state
    end
end
