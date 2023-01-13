class Biblio
    attr_accessor :listAdh,:listMat,:listDoc,:listEmpDoc,:listEmpMat
    def initialize
      @listAdh=[]
      @listMat=[]
      @listDoc=[]
      @listAuteur=[]
      @listEmpDoc=[]
      @listEmpMat=[]
    end
    #liste des adherents
    def addAdh(adherent)
        @listAdh.push(adherent)
    end
    def afficheAdh()
        for ad in @listAdh 
            ad.to_s
        end
    end
    #chercher adherent correspondant a un id
    def chercherAdh(ida)
        for ad in @listAdh
            if (ad.id == ida)
                return ad
            end
        end
        raise(PersonneInexistante,"adherent inexistant")
    end
    #chercher auteur par id
    def chercherAuteur(ida)
        for at in @listAuteur
            if (at.id == ida)
                return at
            end
        end
        raise(PersonneInexistante,"auteur inexistant")
    end
    #Document corespondant a un ISBN
    def chercherDoc(isbn)
        for doc in @listDoc
            if (doc.isbn == isbn)
                return doc
            end
        end
        raise(DocumentInexistant,"document inexistant")
    end
    #Document grace a un id
     def chercherMat(idm)
        for mat in @listMat
            if mat.id == idm
                return mat
            end
        end
        raise(MaterielInexistant,"Materiel inexistant")
    end
    #supprimer adherent
    def supprimerAdh(adherent)
        @listAdh.delete(adherent)
    end
    #supprimer materiel
    def supprimerMat(materiel)
        @listMat.delete(materiel)
    end
    #supprimer doc
    def supprimerDoc(document)
        @listDoc.delete(document)
    end
    #liste des auteurs
    def addAut(auteur)
        @listAuteur.push(auteur)
    end
    def afficheAut()
        for at in @listAuteur
            at.to_s
        end
    end
    def afficheridAut()
        for at in @listAuteur
           puts " #{at.id}"
        end
    end

   

   
    #liste des documents
    def addDoc(document)
        @listDoc.push(document)
    end
    def afficheDoc()
        for doc in @listDoc 
            doc.to_s
        end
    end
  
  
    #list des materiels
    def addMat(materiel)
        @listMat.push(materiel)
    end
    def afficheMat
        for mat in @listMat 
            mat.to_s
        end
    end
    def afficheridMat()
        for mat in @listMat
           puts " #{mat.id}"
        end
    end
   
    #############Ajouter aux documents empruntes
    def addEmpruntDoc(doc)
        @listEmpDoc.push(doc)
    end
    ####################supprimer emprunt
    def supEmpruntDoc(doc)
        @listEmpDoc.delete(doc)
    end
    ##########################
    def afficheEmpruntDoc()
        for doc in @listEmpDoc
            doc.to_s
        end
    end
    ############################### Ajouter au materiel empruntes
    def addEmpruntMat(mat)
        @listEmpMat.push(mat)
    end
    #############################Supprimer emprunt
    def supEmpruntMat(mat)
        @listEmpMat.delete(mat)
    end
    #############################
    def supEmpruntDoc(doc)
        @listEmpDoc.delete(doc)
    end
    ####################
    def afficheEmpruntMat()
        for mat in @listEmpMat
            mat.to_s
        end
    end
    ############################################CSV##################################
    def adh_to_csv #ajouter les adherants à un fichier.csv
        CSV.open('adherants.csv', "w") do |csv|
          csv << ["ID", "Nom", "Prenom", "Documents empruntés", "Matériel Emprunté"]
          @listAdh.each { |adh|
            csv << [adh.id, adh.nom, adh.prenom, adh.doc_empruntes, adh.mat_empruntes]
          }
        end
    end
    ################## a partir dun fichier csv 
      def adh_from_csv
        table = CSV.parse(File.read("adherants.csv"), headers: true)
        table.each do |row|
          adh = Adherent.new( row['Nom'], row['Prenom'])
          @listAdh.push(adh)
        end
        puts "La nouvelle liste d'adherants"
        puts @listAdh
      end
    #############################################################
    def trouver_mot(mot)
       l= @listDoc.select{|doc|
            doc.titre.include?(mot)
        }
        for t in l
            t.to_s
        end
    end
end

#########################################
class PersonneInexistante < RuntimeError
end

class DocumentInexistant < RuntimeError
end

class MaterielInexistant < RuntimeError
end
########################################
class DejaEmprunte < RuntimeError
end
#########################
class MaterielIndisponible < RuntimeError
end
########################################
class DocumentIndisponible < RuntimeError
end



#ajouter un adherent a la bibilotheque
#bib.add
#ajouter un livre a la bibliotheque
#ajouter ordinateur a la bibilotheque
##################################Les collections -Listes#########
#la collection des adherents
#La liste des documents
#La collection des materiels
#########################
#supprime un adherent de la biblio
#supprime un materiel de la biblio
#supprimer un document de la biblio
