require "open-uri"

puts "Seed Started"
puts "Destroying all users, scores, pages and collections 😱😱😱"
User.destroy_all
Composer.destroy_all
Score.destroy_all
Page.destroy_all
Collection.destroy_all

puts "Creating Pierre 😎"
pierre = User.new(email: "pierre@getwolfgang.com", password: "123456", username: "Pierre", first_name: "Pierre", last_name: "Penhard" )
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/users/pierre_penhard.jpg")].first)
pierre.picture.attach(io: file, filename: 'pierre_penhard.jpg', content_type: 'image/jpg')
pierre.save!

puts "Creating Nathalie 🤩"
nathalie = User.new(email: "nathalie@getwolfgang.com", password: "123456", username: "Nathalie", first_name: "Nathalie", last_name: "Freyburger" )
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/users/nathalie_freyburger.jpg")].first)
nathalie.picture.attach(io: file, filename: 'nathalie_freyburger.jpg', content_type: 'image/jpg')
nathalie.save!
puts "🐱‍🏍🐱‍🏍🐱‍🏍"

puts "Pierre's first collection ✨"
pierre_first_collection = Collection.new(title: 'My collection', private: false)
pierre_first_collection.user = pierre
pierre_first_collection.save!

puts "Nathalie's first collection ✨"
nathalie_first_collection = Collection.new(private: false)
nathalie_first_collection.user = nathalie
nathalie_first_collection.save!

puts "Birth of Wolfgang Amadeus Mozart 👼 (1756 – 1791)"
mozart = Composer.new(name: "Wolfgang Amadeus Mozart")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/wolfgang_amadeus_mozart.jpg")].first)
mozart.picture.attach(io: file, filename: 'wolfgang_amadeus_mozart.jpg', content_type: 'image/jpg')
mozart.save!

puts " 1 > Befraget mich ein zartes Kind 🎼"
befraget_mich_ein_zartes_kind = Score.new(title: "Befraget mich ein zartes Kind", score_creation_date: "1768")
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.composer = mozart
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.save!

puts "Birth of Giuseppe Verdi 👼 (1813 – 1901)"
verdi = Composer.new(name: "Giuseppe Verdi")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/giuseppe_verdi.jpg")].first)
verdi.picture.attach(io: file, filename: 'giuseppe_verdi.jpg', content_type: 'image/jpg')
verdi.save!

puts "2 > Che non avrebbe il misero 🎼"
che_non_avrebbe_il_misero = Score.new(title: "Che non avrebbe il misero", score_creation_date: "1845")
che_non_avrebbe_il_misero.composer = verdi
che_non_avrebbe_il_misero.collection = pierre_first_collection
che_non_avrebbe_il_misero.save!

puts "Birth of Justin Hurwitz 👼 (1985 - )"
hurwitz = Composer.new(name: "Justin Hurwitz")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/justin_hurwitz.jpg")].first)
hurwitz.picture.attach(io: file, filename: 'justin_hurwitz.jpg', content_type: 'image/jpg')
hurwitz.save!

puts "3 > Mia & Sebastian's Theme 🎼"
mia_and_Sebastians_theme = Score.new(title: "Mia & Sebastian's Theme", score_creation_date: "2010")
mia_and_Sebastians_theme.composer = hurwitz
mia_and_Sebastians_theme.collection = pierre_first_collection
mia_and_Sebastians_theme.save!

puts "Birth of Ella Fitzgerald 👼 (1917 – 1996)"
fitzgerald = Composer.new(name: "Ella Fitzgerald")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/ella_fitzgerald.jpg")].first)
fitzgerald.picture.attach(io: file, filename: 'ella_fitzgerald.jpg', content_type: 'image/jpg')
fitzgerald.save!

puts "4 > All Of Me - Ella Fitzgerald 🎼"
all_of_me = Score.new(title: "All Of Me", score_creation_date: "1931")
all_of_me.collection = pierre_first_collection
all_of_me.composer = fitzgerald
all_of_me.save!

puts "Creation of The Cinematic Orchestra 🎉 (1999 - )"
cinematic_orchestra = Composer.new(name: "The Cinematic Orchestra")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/cinematic_orchestra.jpg")].first)
cinematic_orchestra.picture.attach(io: file, filename: 'cinematic_orchestra.jpg', content_type: 'image/jpg')
cinematic_orchestra.save!

puts "5 > Arrival of the birds - the cinematic orchestra 🎼"
arrival_of_the_birds = Score.new(title: "Arrival of the birds", score_creation_date: "2012")
arrival_of_the_birds.composer = cinematic_orchestra
arrival_of_the_birds.collection = pierre_first_collection
arrival_of_the_birds.save!

puts "Birth of Erik Satie 👼 (1866 – 1925)"
satie = Composer.new(name: "Erik Satie")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/erik_satie.jpg")].first)
satie.picture.attach(io: file, filename: 'erik_satie.jpg', content_type: 'image/jpg')
satie.save!

puts "6 > Erik_Satie_-_Gymnopedie_No.1 🎼"
gymnopedie_no_1 = Score.new(title: "Gymnopédie N°1", score_creation_date: "1897")
gymnopedie_no_1.composer = satie
gymnopedie_no_1.collection = nathalie_first_collection
gymnopedie_no_1.save!

puts "Birth of Ennio Morricone 👼 (1928 – 2020)"
morricone = Composer.new(name: "Ennio Morricone")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/ennio_morricone.jpg")].first)
morricone.picture.attach(io: file, filename: 'ennio_morricone.jpg', content_type: 'image/jpg')
morricone.save!

puts "7 > Gabriels_Oboe_-_Ennio_Morricone 🎼"
gabriels_oboe = Score.new(title: "Gabriel's Oboe", score_creation_date: "1986")
gabriels_oboe.composer = morricone
gabriels_oboe.collection = nathalie_first_collection
gabriels_oboe.save!

puts "Birth of James Brown 👼 (1933 – 2006)"
brown = Composer.new(name: "James Brown")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/james_brown.jpg")].first)
brown.picture.attach(io: file, filename: 'james_brown.jpg', content_type: 'image/jpg')
brown.save!

puts "8 > I_FEEL_GOOD_de_James_Brown 🎼"
i_feel_good = Score.new(title: "I feel good", score_creation_date: "1964")
i_feel_good.composer = brown
i_feel_good.collection = nathalie_first_collection
i_feel_good.save!

puts "Birth of Franz Schubert 👼 (1797 – 1828)"
schubert = Composer.new(name: "Franz Schubert")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/franz_schubert.jpg")].first)
schubert.picture.attach(io: file, filename: 'franz_schubert.jpg', content_type: 'image/jpg')
schubert.save!

puts "9  > Franz Schubert - Standchen from Schwanengesang Serenade for Piano 🎼"
standchen_from_Schwanengesang_Serenade_for_Piano = Score.new(title: "Standchen from Schwanengesang Serenade for Piano", score_creation_date: "1828")
standchen_from_Schwanengesang_Serenade_for_Piano.composer = schubert
standchen_from_Schwanengesang_Serenade_for_Piano.collection = nathalie_first_collection
standchen_from_Schwanengesang_Serenade_for_Piano.save!

puts "Birth of Hans Zimmer 👼 (1957 - )"
zimmer = Composer.new(name: "Hans Zimmer")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/hans_zimmer.jpg")].first)
zimmer.picture.attach(io: file, filename: 'hans_zimmer.jpg', content_type: 'image/jpg')
zimmer.save!

puts "10  > Time Inception - Hans Zimmer 🎼"
time = Score.new(title: "Time", score_creation_date: "2010")
time.collection = nathalie_first_collection
time.composer = zimmer
time.save!
