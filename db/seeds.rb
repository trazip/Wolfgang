require "open-uri"

puts "Seed Started"
puts "Destroying all users, scores, pages and collections 😱😱😱"
User.destroy_all
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

puts "Birth of Wolfgang Amadeus Mozart 👼"
mozart = Composer.create!(name: "Wolfgang Amadeus Mozart")

puts " 1 > Befraget mich ein zartes Kind 🎼"
befraget_mich_ein_zartes_kind = Score.new(title: "Befraget mich ein zartes Kind", score_creation_date: "1768")
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.composer = mozart
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.save!

puts "Birth of Giuseppe Verdi 👼"
verdi = Composer.create!(name: "Giuseppe Verdi")

puts "2 > Che non avrebbe il misero 🎼"
che_non_avrebbe_il_misero = Score.new(title: "Che non avrebbe il misero", score_creation_date: "1845")
che_non_avrebbe_il_misero.composer = verdi
che_non_avrebbe_il_misero.collection = pierre_first_collection
che_non_avrebbe_il_misero.save!

puts "Birth of Justin Hurwitz 👼"
hurwitz = Composer.create!(name: "Justin Hurwitz")

puts "3 > Mia & Sebastian's Theme 🎼"
mia_and_Sebastians_theme = Score.new(title: "Mia & Sebastian's Theme", score_creation_date: "2010")
mia_and_Sebastians_theme.composer = hurwitz
mia_and_Sebastians_theme.collection = pierre_first_collection
mia_and_Sebastians_theme.save!

puts "Birth of Ella Fitzgerald 👼"
fitzgerald = Composer.create!(name: "Ella Fitzgerald")

puts "4 > All Of Me - Ella Fitzgerald 🎼"
all_of_me = Score.new(title: "All Of Me", score_creation_date: "1931")
all_of_me.collection = pierre_first_collection
all_of_me.composer = fitzgerald
all_of_me.save!

puts "Creation of The Cinematic Orchestra 👼"
cinematic_orchestra = Composer.create!(name: "The Cinematic Orchestra")

puts "5 > Arrival of the birds - the cinematic orchestra 🎼"
arrival_of_the_birds = Score.new(title: "Arrival of the birds", score_creation_date: "2012")
arrival_of_the_birds.composer = cinematic_orchestra
arrival_of_the_birds.collection = pierre_first_collection
arrival_of_the_birds.save!

puts "Birth of Erik Satie 👼"
satie = Composer.create!(name: "Erik Satie")

puts "6 > Erik_Satie_-_Gymnopedie_No.1 🎼"
gymnopedie_no_1 = Score.new(title: "Gymnopédie N°1", score_creation_date: "1897")
gymnopedie_no_1.composer = satie
gymnopedie_no_1.collection = nathalie_first_collection
gymnopedie_no_1.save!

puts "Birth of Ennio Morricone 👼"
morricone = Composer.create!(name: "Ennio Morricone")

puts "7 > Gabriels_Oboe_-_Ennio_Morricone 🎼"
gabriels_oboe = Score.new(title: "Gabriel's Oboe", score_creation_date: "1986")
gabriels_oboe.composer = morricone
gabriels_oboe.collection = nathalie_first_collection
gabriels_oboe.save!

puts "Birth of James Brown 👼"
brown = Composer.create!(name: "James Brown")

puts "8 > I_FEEL_GOOD_de_James_Brown 🎼"
i_feel_good = Score.new(title: "I feel good", score_creation_date: "1964")
i_feel_good.composer = brown
i_feel_good.collection = nathalie_first_collection
i_feel_good.save!

puts "Birth of Franz Schubert 👼"
schubert = Composer.create!(name: "Franz Schubert")

puts "9  > Franz Schubert - Standchen from Schwanengesang Serenade for Piano 🎼"
standchen_from_Schwanengesang_Serenade_for_Piano = Score.new(title: "Standchen from Schwanengesang Serenade for Piano", score_creation_date: "1828")
standchen_from_Schwanengesang_Serenade_for_Piano.composer = schubert
standchen_from_Schwanengesang_Serenade_for_Piano.collection = nathalie_first_collection
standchen_from_Schwanengesang_Serenade_for_Piano.save!

puts "Birth of Hans Zimmer 👼"
zimmer = Composer.create!(name: "Hans Zimmer")

puts "10  > Time Inception - Hans Zimmer 🎼"
time = Score.new(title: "Time", score_creation_date: "2010")
time.collection = nathalie_first_collection
time.composer = zimmer
time.save!
