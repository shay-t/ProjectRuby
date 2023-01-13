class Personne
    attr_reader:id , :nom , :prenom
    @@id1=0
    def initialize(nom="Inconnu",prenom="Inconnu")
        @nom=nom
        @prenom=prenom
        @id=@@id1+1
        @@id1+=1
    end
    #getters
    def self.nom
        @nom
    end
    def self.prenom
        @prenom
    end
end
#############################Adherent####################
class Adherent < Personne
    attr_reader :doc_empruntes, :mat_empruntes,:nbr_doc,:nbr_pc
    #constructeur
    def initialize(nom,prenom)
        super(nom,prenom)
        @doc_empruntes=[]
        @mat_empruntes =[]
        @nbr_doc=0
        @nbr_pc=0
    end
    ###############################Afficher les infos d'un adherents:
    #1-afficher les infos de l'adhérent nom & prenom
    def to_s 
        puts "Adhérent N°: #{@id} - #{@nom} #{@prenom}"
    end
    #2-Afficher la liste des emprunts Dun seul adhérent
    def affiche_doc_empruntes()
        if(docs_empruntes.length != 0)
            then docs_empruntes.each{|x| puts x.to_s}
        else
            puts "Cette adhérent n'a pas emprunté de document"
        end
    end
    def affiche_mat_empruntes()
        if(mat_empruntes.length != 0)
            then mat_empruntes.each{|x| puts x.to_s}
        else
            puts "Cette adhérent n'a pas emprunté de mateiel"
        end
    end
    #retourner un adherent selon id | exception : Pas d'ID correspondant
    #Ajout a la liste des documents empruntes
    def emprunterDocument(doc)
        @doc_empruntes.push(doc)
    end
    #Ajout a la liste du materiel empruntés
    def emprunterMateriel(mat)
        @mat_empruntes.push(mat)
    end
    #Rendre materiel 
    def rendreMateriel(mat)
        @mat_empruntes.delete(mat)
    end
    ###########
    def rendreDocument(doc)
        @doc_empruntes.delete(doc)
    end
    
    #Possibilite demprunter document
    def isAdherentEmprunD?
        if @doc_empruntes.length < 5
            return true
        else
            raise(MaxEmpruntAtteint,"vous ne pouvez plus emprunter des documents")
        end
    end
    #possibilité d'emprunter materiel
    def isAdherentEmprunM?
        if @mat_empruntes.length < 1
            return true
        else
            raise(MaxEmpruntAtteint,"vous ne pouvez plus emprunter des ordinateurs")
        end
    end
    
end
#########################################L'ensemble################################
############################Auteur########################
class Auteur < Personne
    def initialize(nom,prenom)
        super(nom,prenom)
    end
    def to_s 
        puts "Auteur N°: #{@id} - #{@nom} #{@prenom}"
    end

    #retourner un adherent selon id | exception : Pas d'ID correspondant
    #retour lensemble des ids des auteurs (de tout les livre ou dun seul livre)
end