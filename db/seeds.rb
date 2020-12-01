require "open-uri"

puts "Seed Started"
puts "Destroying all users, composers, scores, pages and collections 😱😱😱"
User.destroy_all
Composer.destroy_all
Score.destroy_all
Page.destroy_all
Collection.destroy_all

puts "Creating Pierre 😎"
pierre = User.new(email: "pierre@getwolfgang.com", password: "123456", username: "Pierre", first_name: "Pierre", last_name: "Penhard", admin: true)
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
mozart = Composer.new(name: "W.A. Mozart", bio: "Wolfgang Amadeus Mozart (27 January 1756 – 5 December 1791) Le nom officiel de Mozart était : Joannes Chrysostomus Wolfgangus Theophilus Mozart. Il s'est d'ailleurs amusé tout au long de sa vie à déguiser et à déformer son identité en Mozartini, Gangflow (Wolfgang à l'envers), ou encore Trazom… On ne le verra jamais signer Amadeus (mais Amadé), ce prénom ne sera employé qu'après sa mort.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/wolfgang_amadeus_mozart.jpg")].first)
mozart.picture.attach(io: file, filename: 'wolfgang_amadeus_mozart.jpg', content_type: 'image/jpg')
mozart.save!

puts " 1 > Befraget mich ein zartes Kind 🎼"
befraget_mich_ein_zartes_kind = Score.new(title: "Befraget mich ein zartes Kind", score_creation_date: "1768", page_count: 2)
befraget_mich_ein_zartes_kind.collection = pierre_first_collection
befraget_mich_ein_zartes_kind.composer = mozart
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Befraget_mich_ein_zartes_Kind_Mozart.pdf")].first)
befraget_mich_ein_zartes_kind.file.attach(io: file, filename: 'befraget_mich_ein_zartes_kind.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/1.png'))
befraget_mich_ein_zartes_kind.cover.attach(io: cover, filename: 'cover_1', content_type: 'image/png')
befraget_mich_ein_zartes_kind.save!

puts "Birth of Giuseppe Verdi 👼 (1813 – 1901)"
verdi = Composer.new(name: "G. Verdi", bio: "Giuseppe Fortunino Francesco Verdi (9 or 10 October 1813 – 27 January 1901) En panne d'inspiration, écrasé par les coups du destin, ses deux enfants puis sa femme meurent à quelques mois d'intervalle, le compositeur est au bord du gouffre lorsqu'on lui confie le livret de ce qui va devenir... Nabucco.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/giuseppe_verdi.jpg")].first)
verdi.picture.attach(io: file, filename: 'giuseppe_verdi.jpg', content_type: 'image/jpg')
verdi.save!

puts "2 > Che non avrebbe il misero 🎼"
che_non_avrebbe_il_misero = Score.new(title: "Che non avrebbe il misero", score_creation_date: "1845", page_count: 2)
che_non_avrebbe_il_misero.composer = verdi
che_non_avrebbe_il_misero.collection = pierre_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Che_non_avrebbe_il_misero_Verdi.pdf")].first)
che_non_avrebbe_il_misero.file.attach(io: file, filename: 'Che_non_avrebbe_il_misero_Verdi.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/2.png'))
che_non_avrebbe_il_misero.cover.attach(io: cover, filename: 'cover_2', content_type: 'image/png')
che_non_avrebbe_il_misero.save!

puts "Birth of Justin Hurwitz 👼 (1985 - )"
hurwitz = Composer.new(name: "J. Hurwitz", bio:"Justin Hurwitz (22 January 1985) Il est notamment connu pour ses collaborations avec le cinéaste Damien Chazelle sur les films Whiplash (2014) et La La Land (2016), film pour lequel il obtient deux Oscars en 2017 ")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/justin_hurwitz.jpg")].first)
hurwitz.picture.attach(io: file, filename: 'justin_hurwitz.jpg', content_type: 'image/jpg')
hurwitz.save!

puts "3 > Mia & Sebastian's Theme 🎼"
mia_and_Sebastians_theme = Score.new(title: "Mia & Sebastian's Theme", score_creation_date: "2010")
mia_and_Sebastians_theme.composer = hurwitz
mia_and_Sebastians_theme.collection = pierre_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Mia_and_Sebastians_Theme_from_La_La_Land.pdf")].first)
mia_and_Sebastians_theme.file.attach(io: file, filename: 'Mia_and_Sebastians_Theme_from_La_La_Land.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/3.png'))
mia_and_Sebastians_theme.cover.attach(io: cover, filename: 'cover_3', content_type: 'image/png')
mia_and_Sebastians_theme.save!

puts "Birth of Ella Fitzgerald 👼 (1917 – 1996)"
fitzgerald = Composer.new(name: "E. Fitzgerald", bio:"Ella Jane Fitzgerald (April 25, 1917 – June 15, 1996) Elle est considérée comme l'une des plus importantes et célèbres chanteuses de jazz de l'histoire de ce genre musical, avec une tessiture de trois octaves, remarquable pour la pureté de sa voix et sa capacité d'improvisation, particulièrement en scat.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/ella_fitzgerald.jpg")].first)
fitzgerald.picture.attach(io: file, filename: 'ella_fitzgerald.jpg', content_type: 'image/jpg')
fitzgerald.save!

puts "4 > All Of Me - Ella Fitzgerald 🎼"
all_of_me = Score.new(title: "All Of Me", score_creation_date: "1931")
all_of_me.collection = pierre_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/All_Of_Me_Ella_Fitzgerald_Solo_Transcription.pdf")].first)
all_of_me.file.attach(io: file, filename: 'All_Of_Me_Ella_Fitzgerald_Solo_Transcription.pdf', content_type: 'application/pdf')
all_of_me.composer = fitzgerald
cover = File.open(File.join(Rails.root,'app/assets/images/covers/4.png'))
all_of_me.cover.attach(io: cover, filename: 'cover_4', content_type: 'image/png')
all_of_me.save!

puts "Creation of The Cinematic Orchestra 🎉 (1999 - )"
cinematic_orchestra = Composer.new(name: "The Cinematic Orchestra", bio: "The Cinematic Orchestra est un groupe britannique de nu jazz et downtempo fondé en 1999 par Jason Swinscoe, alors employé de la maison de disques londonienne Ninja Tune.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/cinematic_orchestra.jpg")].first)
cinematic_orchestra.picture.attach(io: file, filename: 'cinematic_orchestra.jpg', content_type: 'image/jpg')
cinematic_orchestra.save!

puts "5 > Arrival of the birds - the cinematic orchestra 🎼"
arrival_of_the_birds = Score.new(title: "Arrival of the birds", score_creation_date: "2012")
arrival_of_the_birds.composer = cinematic_orchestra
arrival_of_the_birds.collection = pierre_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Arrival_of_the_birds_cinematic_orchestra.pdf")].first)
arrival_of_the_birds.file.attach(io: file, filename: 'Arrival_of_the_birds_cinematic_orchestra.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/5.png'))
arrival_of_the_birds.cover.attach(io: cover, filename: 'cover_5', content_type: 'image/png')
arrival_of_the_birds.save!

puts "Birth of Erik Satie 👼 (1866 – 1925)"
satie = Composer.new(name: "E. Satie", bio: "Éric Alfred Leslie Satie (17 May 1866 – 1 July 1925) Associé un temps au symbolisme, mais inclassable, il a été reconnu comme précurseur de plusieurs mouvements, dont le surréalisme, le minimalisme, la musique répétitive et le théâtre de l'absurde.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/erik_satie.jpg")].first)
satie.picture.attach(io: file, filename: 'erik_satie.jpg', content_type: 'image/jpg')
satie.save!

puts "6 > Erik_Satie_-_Gymnopedie_No.1 🎼"
gymnopedie_no_1 = Score.new(title: "Gymnopédie N°1", score_creation_date: "1897")
gymnopedie_no_1.composer = satie
gymnopedie_no_1.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Erik_Satie_Gymnopedie_No_1.pdf")].first)
gymnopedie_no_1.file.attach(io: file, filename: 'Erik_Satie_Gymnopedie_No_1.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/6.png'))
gymnopedie_no_1.cover.attach(io: cover, filename: 'cover_6', content_type: 'image/png')
gymnopedie_no_1.save!

puts "Birth of Ennio Morricone 👼 (1928 – 2020)"
morricone = Composer.new(name: "E. Morricone")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/ennio_morricone.jpg")].first)
morricone.picture.attach(io: file, filename: 'ennio_morricone.jpg', content_type: 'image/jpg')
morricone.save!

puts "7 > Gabriels_Oboe_-_Ennio_Morricone 🎼"
gabriels_oboe = Score.new(title: "Gabriel's Oboe", score_creation_date: "1986")
gabriels_oboe.composer = morricone
gabriels_oboe.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Gabriels_Oboe_Ennio_Morricone.pdf")].first)
gabriels_oboe.file.attach(io: file, filename: 'Gabriels_Oboe_Ennio_Morricone.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/7.png'))
gabriels_oboe.cover.attach(io: cover, filename: 'cover_7', content_type: 'image/png')
gabriels_oboe.save!

puts "Birth of James Brown 👼 (1933 – 2006)"
brown = Composer.new(name: "J. Brown")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/james_brown.jpg")].first)
brown.picture.attach(io: file, filename: 'james_brown.jpg', content_type: 'image/jpg')
brown.save!

puts "8 > I_FEEL_GOOD_de_James_Brown 🎼"
i_feel_good = Score.new(title: "I feel good", score_creation_date: "1964")
i_feel_good.composer = brown
i_feel_good.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/I_FEEL_GOOD_de_James_Brown.pdf")].first)
i_feel_good.file.attach(io: file, filename: 'I_FEEL_GOOD_de_James_Brown.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/8.png'))
i_feel_good.cover.attach(io: cover, filename: 'cover_8', content_type: 'image/png')
i_feel_good.save!

puts "Birth of Franz Schubert 👼 (1797 – 1828)"
schubert = Composer.new(name: "F. Schubert")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/franz_schubert.jpg")].first)
schubert.picture.attach(io: file, filename: 'franz_schubert.jpg', content_type: 'image/jpg')
schubert.save!

puts "9  > Franz Schubert - Standchen from Schwanengesang Serenade for Piano 🎼"
standchen_from_Schwanengesang_Serenade_for_Piano = Score.new(title: "Ständchen (for piano)", score_creation_date: "1828")
standchen_from_Schwanengesang_Serenade_for_Piano.composer = schubert
standchen_from_Schwanengesang_Serenade_for_Piano.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Schubert_Standchen_from_Schwanengesang_Serenade_for_Piano_Four_Hands.pdf")].first)
standchen_from_Schwanengesang_Serenade_for_Piano.file.attach(io: file, filename: 'Schubert_Standchen_from_Schwanengesang_Serenade_for_Piano_Four_Hands.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/9.png'))
standchen_from_Schwanengesang_Serenade_for_Piano.cover.attach(io: cover, filename: 'cover_9', content_type: 'image/png')
standchen_from_Schwanengesang_Serenade_for_Piano.save!

puts "Birth of Hans Zimmer 👼 (1957 - )"
zimmer = Composer.new(name: "H. Zimmer")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/hans_zimmer.jpg")].first)
zimmer.picture.attach(io: file, filename: 'hans_zimmer.jpg', content_type: 'image/jpg')
zimmer.save!

puts "10  > Time Inception - Hans Zimmer 🎼"
time = Score.new(title: "Time", score_creation_date: "2010")
time.collection = nathalie_first_collection
time.composer = zimmer
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Time_Inception_Hans_Zimmer.pdf")].first)
time.file.attach(io: file, filename: 'Time_Inception_Hans_Zimmer.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/10.png'))
time.cover.attach(io: cover, filename: 'cover_10', content_type: 'image/png')
time.save!
