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

puts "Pierre's first collection 🤫"
pierre_first_collection = Collection.new(private: true)
pierre_first_collection.user = pierre
pierre_first_collection.save!

puts " 1 > Befraget mich ein zartes Kind 🎼"
befraget_mich_ein_zartes_kind = Score.new(title: "Befraget mich ein zartes Kind", composer: "Wolfgang Amadeus Mozart", score_creation_date: "1768")
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.save!

puts "2 > Che non avrebbe il misero 🎼"
che_non_avrebbe_il_misero = Score.new(title: "Che non avrebbe il misero", composer: "Giuseppe Verdi", score_creation_date: "1845")
che_non_avrebbe_il_misero.save!

puts "3 > Mia & Sebastian's Theme 🎼"
mia_and_Sebastians_theme = Score.new(title: "Mia & Sebastian's Theme", composer: "Justin Hurwitz", score_creation_date: "2010")
mia_and_Sebastians_theme.save!

puts "4 > All Of Me - Ella Fitzgerald 🎼"
all_of_me = Score.new(title: "All Of Me", composer: "Ella Fitzgerald", score_creation_date: "1931")
all_of_me.save!

puts "5 > Arrival of the birds - the cinematic orchestra 🎼"
arrival_of_the_birds = Score.new(title: "Arrival of the birds", composer: "The Cinematic Orchestra", score_creation_date: "2012")
arrival_of_the_birds.save!

puts "6 > Erik_Satie_-_Gymnopedie_No.1 🎼"
gynopedie_no_1 = Score.new(title: "Gymnopédie N°1", composer: "Erik Satie", score_creation_date: "1897")
gynopedie_no_1.save!

puts "7 > Gabriels_Oboe_-_Ennio_Morricone 🎼"
gabriels_oboe = Score.new(title: "Gabriel's Oboe", composer: "Ennio Morricone", score_creation_date: "1986")
gabriels_oboe.save!

puts "8 > I_FEEL_GOOD_de_James_Brown 🎼"
i_feel_good = Score.new(title: "I feel good", composer: "James Brown", score_creation_date: "1964")
i_feel_good.save!

puts "9  > Franz Schubert - Standchen from Schwanengesang Serenade for Piano 🎼"
standchen_from_Schwanengesang_Serenade_for_Piano = Score.new(title: "Standchen from Schwanengesang Serenade for Piano", composer: "Franz Schubert", score_creation_date: "1828")
standchen_from_Schwanengesang_Serenade_for_Piano.save!

puts "10  > Time Inception - Hans Zimmer 🎼"
time = Score.new(title: "Time", composer: "Hans Zimmer", score_creation_date: "2010")
time.save!
