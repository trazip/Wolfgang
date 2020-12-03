require "open-uri"

puts "Seed Started"
puts "Destroying all users, composers, scores, pages and collections 😱😱😱"
User.destroy_all
Composer.destroy_all
Score.destroy_all
Page.destroy_all
Collection.destroy_all

def push_pages_to_cloudinary(file, score)
  reader = PDF::Reader.new(open(file))
  score.page_count = reader.page_count
  score.save
  ImportScorePagesJob.perform_later(score)
end

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
nathalie_first_collection = Collection.new(title: 'My collection', private: false)
nathalie_first_collection.user = nathalie
nathalie_first_collection.save!

puts "Birth of Wolfgang Amadeus Mozart 👼 (1756 – 1791)"
mozart = Composer.new(name: "W.A. Mozart", bio: "Wolfgang Amadeus Mozart (1756 – 1791) baptised as Johannes Chrysostomus Wolfgangus Theophilus Mozart. He composed more than 600 works, many of which are acknowledged as pinnacles of symphonic, concertante, chamber, operatic, and choral music. He is considered among the greatest classical composers of all time, and his influence on Western music is profound")
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
push_pages_to_cloudinary(file, befraget_mich_ein_zartes_kind)

puts "Birth of Giuseppe Verdi 👼 (1813 – 1901)"
verdi = Composer.new(name: "G. Verdi", bio: "Giuseppe Fortunino Francesco Verdi (1813 – 1901) was an Italian opera composer. His operas remain extremely popular, especially the three peaks of his 'middle period': Rigoletto, Il trovatore and La traviata, and the 2013 bicentenary of his birth was widely celebrated in broadcasts and performances.")
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
push_pages_to_cloudinary(file, che_non_avrebbe_il_misero)

puts "Birth of Justin Hurwitz 👼 (1985 - )"
hurwitz = Composer.new(name: "J. Hurwitz", bio:"Justin Hurwitz (1985) is an American film composer and a television writer. He is best known for his longtime collaboration with director Damien Chazelle, scoring each of his films: Guy and Madeline on a Park Bench (2009), Whiplash (2014), La La Land (2016), and First Man (2018)")
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
push_pages_to_cloudinary(file, mia_and_Sebastians_theme)

puts "Birth of Ella Fitzgerald 👼 (1917 – 1996)"
fitzgerald = Composer.new(name: "E. Fitzgerald", bio:"Ella Jane Fitzgerald (1917 – 1996) was an American jazz singer, sometimes referred to as the First Lady of Song, Queen of Jazz, and Lady Ella. She was noted for her purity of tone, impeccable diction, phrasing, timing, intonation, and a horn-like improvisational ability, particularly in her scat singing.")
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
push_pages_to_cloudinary(file, all_of_me)

# puts "Creation of The Cinematic Orchestra 🎉 (1999 - )"
# cinematic_orchestra = Composer.new(name: "The Cinematic Orchestra", bio: "The Cinematic Orchestra est un groupe britannique de nu jazz et downtempo fondé en 1999 par Jason Swinscoe, alors employé de la maison de disques londonienne Ninja Tune.")
# file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/cinematic_orchestra.jpg")].first)
# cinematic_orchestra.picture.attach(io: file, filename: 'cinematic_orchestra.jpg', content_type: 'image/jpg')
# cinematic_orchestra.save!

# puts "5 > Arrival of the birds - the cinematic orchestra 🎼"
# arrival_of_the_birds = Score.new(title: "Arrival of the birds", score_creation_date: "2012")
# arrival_of_the_birds.composer = cinematic_orchestra
# arrival_of_the_birds.collection = pierre_first_collection
# file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Arrival_of_the_birds_cinematic_orchestra.pdf")].first)
# arrival_of_the_birds.file.attach(io: file, filename: 'Arrival_of_the_birds_cinematic_orchestra.pdf', content_type: 'application/pdf')
# cover = File.open(File.join(Rails.root,'app/assets/images/covers/5.png'))
# arrival_of_the_birds.cover.attach(io: cover, filename: 'cover_5', content_type: 'image/png')
# arrival_of_the_birds.save!
# push_pages_to_cloudinary(file, arrival_of_the_birds)

# puts "Birth of Erik Satie 👼 (1866 – 1925)"
# satie = Composer.new(name: "E. Satie", bio: "Éric Alfred Leslie Satie (17 May 1866 – 1 July 1925) Associé un temps au symbolisme, mais inclassable, il a été reconnu comme précurseur de plusieurs mouvements, dont le surréalisme, le minimalisme, la musique répétitive et le théâtre de l'absurde.")
# file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/erik_satie.jpg")].first)
# satie.picture.attach(io: file, filename: 'erik_satie.jpg', content_type: 'image/jpg')
# satie.save!

# puts "6 > Erik_Satie_-_Gymnopedie_No.1 🎼"
# gymnopedie_no_1 = Score.new(title: "Gymnopédie N°1", score_creation_date: "1897")
# gymnopedie_no_1.composer = satie
# gymnopedie_no_1.collection = nathalie_first_collection
# file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Erik_Satie_Gymnopedie_No_1.pdf")].first)
# gymnopedie_no_1.file.attach(io: file, filename: 'Erik_Satie_Gymnopedie_No_1.pdf', content_type: 'application/pdf')
# cover = File.open(File.join(Rails.root,'app/assets/images/covers/6.png'))
# gymnopedie_no_1.cover.attach(io: cover, filename: 'cover_6', content_type: 'image/png')
# gymnopedie_no_1.save!
# push_pages_to_cloudinary(file, gymnopedie_no_1)

puts "Birth of Ennio Morricone 👼 (1928 – 2020)"
morricone = Composer.new(name: "E. Morricone", bio: "Ennio Morricone (1928 – 2020) was an Italian composer, orchestrator, conductor, and trumpet player who wrote music in a wide range of styles. With more than 400 scores for cinema and television, as well as more than 100 classical works, Morricone is widely considered as one of the most prolific and greatest film composers of all time.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/ennio_morricone.jpg")].first)
morricone.picture.attach(io: file, filename: 'ennio_morricone.jpg', content_type: 'image/jpg')
morricone.save!

puts "5 > Gabriels_Oboe_-_Ennio_Morricone 🎼"
gabriels_oboe = Score.new(title: "Gabriel's Oboe", score_creation_date: "1986")
gabriels_oboe.composer = morricone
gabriels_oboe.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Gabriels_Oboe_Ennio_Morricone.pdf")].first)
gabriels_oboe.file.attach(io: file, filename: 'Gabriels_Oboe_Ennio_Morricone.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/5.png'))
gabriels_oboe.cover.attach(io: cover, filename: 'cover_5', content_type: 'image/png')
gabriels_oboe.save!
push_pages_to_cloudinary(file, gabriels_oboe)

puts "Birth of L. van Beethoven 👼 (1770 – 1827)"
beethoven = Composer.new(name: "L. van Beethoven", bio: "Ludwig van Beethoven (1770 – 1827) was a German composer and pianist whose music ranks amongst the most performed of the classical music repertoire; he remains one of the most admired composers in the history of Western music. His works span the transition from the classical period to the romantic era in classical music.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/Beethoven.jpg")].first)
beethoven.picture.attach(io: file, filename: 'Beethoven.jpg', content_type: 'image/jpg')
beethoven.save!

puts "8 > Ich_Liebe_Dich_Beethoven 🎼"
ich_liebe_dich = Score.new(title: "Ich Liebe dich", score_creation_date: "1964")
ich_liebe_dich.composer = beethoven
ich_liebe_dich.collection = pierre_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Ich_Liebe_Dich_Beethoven.pdf")].first)
ich_liebe_dich.file.attach(io: file, filename: 'Ich_Liebe_Dich_Beethoven.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/9.png'))
ich_liebe_dich.cover.attach(io: cover, filename: 'cover_9', content_type: 'image/png')
ich_liebe_dich.save!
push_pages_to_cloudinary(file, ich_liebe_dich)

puts "Birth of Franz Schubert 👼 (1797 – 1828)"
schubert = Composer.new(name: "F. Schubert", bio: "Franz Peter Schubert (1797 – 1828) was an Austrian composer of the late Classical and early Romantic eras. Despite his short lifetime, Schubert left behind a vast oeuvre, including more than 600 secular vocal works (mainly lieder), seven complete symphonies, sacred music, operas, incidental music and a large body of piano and chamber music")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/franz_schubert.jpg")].first)
schubert.picture.attach(io: file, filename: 'franz_schubert.jpg', content_type: 'image/jpg')
schubert.save!

puts "9  > Franz Schubert - Standchen from Schwanengesang Serenade for Piano 🎼"
standchen_from_Schwanengesang_Serenade_for_Piano = Score.new(title: "Ständchen (for piano)", score_creation_date: "1828")
standchen_from_Schwanengesang_Serenade_for_Piano.composer = schubert
standchen_from_Schwanengesang_Serenade_for_Piano.collection = nathalie_first_collection
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Schubert_Standchen_from_Schwanengesang_Serenade_for_Piano_Four_Hands.pdf")].first)
standchen_from_Schwanengesang_Serenade_for_Piano.file.attach(io: file, filename: 'Schubert_Standchen_from_Schwanengesang_Serenade_for_Piano_Four_Hands.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/6.png'))
standchen_from_Schwanengesang_Serenade_for_Piano.cover.attach(io: cover, filename: 'cover_6', content_type: 'image/png')
standchen_from_Schwanengesang_Serenade_for_Piano.save!
push_pages_to_cloudinary(file, standchen_from_Schwanengesang_Serenade_for_Piano)

puts "Birth of Hans Zimmer 👼 (1957 - )"
zimmer = Composer.new(name: "H. Zimmer", bio: "Hans Florian Zimmer (1957) is a German film score composer and record producer. Zimmer's works are notable for integrating electronic music sounds with traditional orchestral arrangements. Since the 1980s, he has composed music for over 150 films.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/hans_zimmer.jpg")].first)
zimmer.picture.attach(io: file, filename: 'hans_zimmer.jpg', content_type: 'image/jpg')
zimmer.save!

puts "10  > Time Inception - Hans Zimmer 🎼"
time = Score.new(title: "Time", score_creation_date: "2010")
time.collection = nathalie_first_collection
time.composer = zimmer
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Time_Inception_Hans_Zimmer.pdf")].first)
time.file.attach(io: file, filename: 'Time_Inception_Hans_Zimmer.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/7.png'))
time.cover.attach(io: cover, filename: 'cover_7', content_type: 'image/png')
time.save!
push_pages_to_cloudinary(file, time)

puts "Birth of Jacques Offenbach 👼 (1819 - 1880)"
offenbach = Composer.new(name: "J. Offenbach", bio: "Jacques Offenbach (1819 - 1880) was a German-born French composer, cellist and impresario of the Romantic period. He is remembered for his nearly 100 operettas of the 1850s to the 1870s, and his uncompleted opera The Tales of Hoffmann.")
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/composers/jacques_offenbach.jpg")].first)
offenbach.picture.attach(io: file, filename: 'jacques_offenbach.jpg.jpg', content_type: 'image/jpg')
offenbach.save!

puts "11  > Bolero de Charles Martel - Hans Zimmer 🎼"
bolero = Score.new(title: "Boléro de C. Martel", score_creation_date: "1859")
bolero.collection = nathalie_first_collection
bolero.composer = offenbach
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/bolero_de_charles_martel.pdf")].first)
bolero.file.attach(io: file, filename: 'bolero.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/8.png'))
bolero.cover.attach(io: cover, filename: 'cover_8', content_type: 'image/png')
bolero.save!
push_pages_to_cloudinary(file, bolero)

puts "12  > Se vuol Ballare - W.A. Mozart 🎼"
se = Score.new(title: "Se vuol ballare", score_creation_date: "2010")
se.collection = nathalie_first_collection
se.composer = mozart
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/se_vuol_ballare.pdf")].first)
se.file.attach(io: file, filename: 'se_Inception_Hans_Zimmer.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/10.png'))
se.cover.attach(io: cover, filename: 'cover_10', content_type: 'image/png')
se.save!
push_pages_to_cloudinary(file, se)

puts "12  > K301 - W.A. Mozart 🎼"
sonata = Score.new(title: "Sonata for violin and piano K.301", score_creation_date: "1778")
sonata.collection = nathalie_first_collection
sonata.composer = mozart
file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/scores/Sonata_for_violin_and_piano_K301.pdf")].first)
sonata.file.attach(io: file, filename: 'sonata.pdf', content_type: 'application/pdf')
cover = File.open(File.join(Rails.root,'app/assets/images/covers/13.png'))
sonata.cover.attach(io: cover, filename: 'cover_13', content_type: 'image/png')
sonata.save!
push_pages_to_cloudinary(file, sonata)
