require 'nokogiri'
require 'open-uri'  # Obligatoire avec nokogiri pour charger une page sur le web
require_relative 'effacer_ligne'

# page.xpath(XPATH)[n].text pointe vers le texte du n ème élément ayant comme xpath XPATH sur la page

def init_nokogiri(url)
    print "Chargement de la page Web..."
    page = Nokogiri::HTML(open(url))
    return page
end

def main
    page = init_nokogiri("https://annuaire-des-mairies.com/val-d-oise.html")
    # Si la page contient de données
    if page != nil
        effacer_ligne_terminal
        puts "Page Web chargée !"
        xpath_mairies = '//a[@class="lientxt"]'
        nbr_de_mairies = page.xpath(xpath_mairies).length
        array_mairies = creation_array(page, xpath_mairies, nbr_de_mairies)
        return array_mairies
    end
end

def recuperer_email(lien_page_email, n, nbr_de_mairies)
    page = init_nokogiri(lien_page_email)
    # Si la page contient de données
    if page != nil
        effacer_ligne_terminal
        puts "Page Web #{n+1}/#{nbr_de_mairies} chargée !"
        xpath_email = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'
        return page.xpath(xpath_email).text
    end
end

def creation_array(page, xpath_mairies, nbr_de_mairies)
        array_mairies = Array.new
        (0..nbr_de_mairies-1).each { |n|
            hash_tmp = Hash.new
            mairie = page.xpath(xpath_mairies)[n].text.downcase.gsub(/[\s]/, '_')
            lien = page.xpath(xpath_mairies)[n]['href'].gsub(/^[\.]/, '')
            lien = "https://annuaire-des-mairies.com#{lien}"
            hash_tmp[mairie] = recuperer_email(lien, n, nbr_de_mairies)

            array_mairies << hash_tmp
            puts "Le hash #{hash_tmp} a été ajouté dans le tableau array_mairies"
        }
        return array_mairies
end

main