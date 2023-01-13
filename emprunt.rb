class Emprunt
      attr_accessor:listAdh,:listMat,:listDoc,:listEmp
      def initialize
        @@listAdh=[]
        @listMat=[]
        @listDoc=[]
        @listEmp=[]
      end
      #Aficher la liste des Adhérents de la bibiliotheque
      def self.afficherAdh 
        if @listAdh.length > 0
          puts @listAdh
        else
          puts "La liste des adherants est vide!"
        end
      end
      #Retrouver un adherent grace a son id
      def self.chercherAdh(id)
        if @listAdh.select { |adh| adh.id == id }.length >0
            @listAdh.find { |adh| adh.id == id }
        else
            puts "L'adherant recherché n'existe pas!"
        end
      end
      #Supprimer un Adherent de la liste des adherents
      def self.supprimerAdh(id)
        if @listAdh.select { |adh| adh.id == id }.length > 0
            @listAdh.each do |adh|
                if adh.id == id
                puts "L'adherant #{adh} a été supprimer correctement!"
                @listAdh.delete(adh)
                puts "Nouvelle liste d'adherants:\n"
                afficherAdh
                end
            end
        else
          puts "L'adherant recherché n'existe pas!"
        end
    end
end

##################emprunt###############
#emprunter un ordinateur
#emprunter un livre
#####################Rendre#########
#Rendre un Ordinateur
#Rendreun Livre