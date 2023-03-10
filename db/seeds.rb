require "csv"
require "open-uri"

filepath = "storage/drugsv2.csv"

# Prescription.destroy_all
Doctor.destroy_all
Patient.destroy_all
Pharmacy.destroy_all
Cart.destroy_all
Item.destroy_all

CSV.foreach(filepath, headers: :first_row) do |row|
  Item.create(name: row[0], desc: row[1], administration: row[2], price: 0)
end

doc_knock = Doctor.create!(email: 'docknock@gmail.com', password: 'azerty', first_name: 'Docteur', last_name: 'Knock', address: '3 rue le Goff', ssn: '14701126747696', mutuelle_name:'Lidl', mutuelle_number: '0000836439', rpps: '17459398274', doctor: true )
raoult = Doctor.create!(email: 'raoult@gmail.com', password: 'azerty', first_name: 'Docteur', last_name: 'Raoult', address: '12 avenue de la Grande Armée', ssn: '17723066749696', mutuelle_name:'Osborne.Corp', mutuelle_number: '0000572942', rpps: '18153865409', doctor: true )

fabien = Patient.create!(email: 'fabien@gmail.com', password: 'azerty', first_name: 'Fabien', last_name: 'Marsaud', address: '42 boulevard Raspail', ssn: '17723066749696', mutuelle_name:'Mutuelle', mutuelle_number: '0000572942', rpps: '', doctor: false )
georges = Patient.create!(email: 'bernard@gmail.com', password: 'azerty', first_name: 'Georges', last_name: 'Moustaki', address: '76 rue de Vaugirard', ssn: '17723066749696', mutuelle_name:'Mutuelle', mutuelle_number: '0000572942', rpps: '', doctor: false )

fabien_photo = URI.open('https://upload.wikimedia.org/wikipedia/commons/3/38/Grand_Corps_Malade_D%C3%A9jeuner_C%C3%A9sar_2018.jpg')
fabien.photo.attach(io: fabien_photo, filename: "Fabien.jpg", content_type: "image/jpg")

georges_photo = URI.open('https://www.gala.fr/imgre/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2Fvar.2Fgal.2Fstorage.2Fimages.2Fmedia.2Fmultiupload_du_15_octobre_2011.2Fmoustaki.2F1774975-1-fre-FR.2Fmoustaki.2Ejpg/1504x846/quality/80/georges-moustaki-ne-peut-plus-chanter.jpg')
georges.photo.attach(io: georges_photo, filename: "Georges.jpg", content_type: "image/jpg")

doc_knock_photo = URI.open('https://philitt.fr/wp-content/uploads/2013/10/18865759-9ef1b.jpg')
doc_knock.photo.attach(io: doc_knock_photo, filename: "DocKnock.jpg", content_type: "image/jpg")

raoult_photo = URI.open('https://cloudfront-eu-central-1.images.arcpublishing.com/leparisien/553ZIG5WSBDW5HNQ2FN4TOENLY.jpg')
raoult.photo.attach(io: raoult_photo, filename: "DocOc.jpg", content_type: "image/jpg")

prescription_1 = Prescription.create!(date: '06/03/2019', status: 2, doctor_id: doc_knock.id, patient_id: georges.id)
prescription_2 = Prescription.create!(date: '14/06/2019', status: 2, doctor_id: doc_knock.id, patient_id: georges.id)
prescription_3 = Prescription.create!(date: '30/01/2020', status: 2, doctor_id: doc_knock.id, patient_id: georges.id)
prescription_4 = Prescription.create!(date: '22/08/2020', status: 2, doctor_id: doc_knock.id, patient_id: fabien.id)
prescription_5 = Prescription.create!(date: '28/02/2021', status: 2, doctor_id: doc_knock.id, patient_id: fabien.id)
prescription_6 = Prescription.create!(date: '12/07/2021', status: 2, doctor_id: doc_knock.id, patient_id: fabien.id)
prescription_7 = Prescription.create!(date: '14/07/2021', status: 2, doctor_id: raoult.id, patient_id: fabien.id)
prescription_8 = Prescription.create!(date: '31/05/2022', status: 2, doctor_id: raoult.id, patient_id: fabien.id)
prescription_9 = Prescription.create!(date: '30/06/2022', status: 2, doctor_id: raoult.id, patient_id: fabien.id)
prescription_10 = Prescription.create!(date: '15/07/2022', status: 2, doctor_id: raoult.id, patient_id: georges.id)
prescription_11 = Prescription.create!(date: '25/01/2023', status: 2, doctor_id: raoult.id, patient_id: georges.id)
prescription_12 = Prescription.create!(date: '11/02/2023', status: 2, doctor_id: raoult.id, patient_id: georges.id)

pharmacy_2 = Pharmacy.create!(name: 'Pharmatop', address: '48 boulevard Raspail, Paris ')
pharmacy_3 = Pharmacy.create!(name: 'Pharmapastop', address: '2 rue Malebranche, Paris')
pharmacy_4 = Pharmacy.create!(name: 'Pharmasifreddi', address: '3 rue des Petites Ecuries, Paris')
pharmacy_5 = Pharmacy.create!(name: 'Pharmacorp', address: '67 boulevard Saint-Germain, Paris')
pharmacy_6 = Pharmacy.create!(name: 'PhOmarSy', address: '15 rue Oberkampf, Paris')
pharmacy_7 = Pharmacy.create!(name: 'Pharmaté', address: '42 rue de Grenelle, Paris')
pharmacy_8 = Pharmacy.create!(name: 'Pharmapop', address: '4 rue Cail, Paris')
pharmacy_9 = Pharmacy.create!(name: 'Pharmol', address: '1 rue Caillou Mérard, Paris')
pharmacy_10 = Pharmacy.create!(name: 'Pharniente', address: '4 boulevard des Italiens, Paris')
Pharmacy.create!(name: "Pharmacie du 20ème", address: "144 Bd de Ménilmontant, 75020 Paris")
Pharmacy.create!(name: "Pharmacie Couronnes", address: "43 Bd de Belleville, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Rossi", address: "152 Rue Oberkampf, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Azencott", address: "43 Rue des Maronites, 75020 Paris")
Pharmacy.create!(name: "Pharmacie Assoun", address: "53 Av. de la République, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Gardette", address: "38 Ave Parmentier, 75011 Paris")
Pharmacy.create!(name: "Pharmacie du 58", address: "58 Rue Oberkampf, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Sebban Alain", address: "84 Bd Richard-Lenoir, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Delalande Le Dantec", address: "130 Ave Parmentier, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Sabaa", address: "24 Rue Oberkampf, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Saint Martin", address: "28 Rue du Faubourg du Temple, 75011 Paris")
Pharmacy.create!(name: "Pharmacie Voltaire", address: "29 Bd Voltaire, 75011 Paris")
Pharmacy.create!(name: "Pharmacie du Calvaire", address: "2 Bd des Filles du Calvaire, 75011 Paris")
Pharmacy.create!(name: "Pharmacie du Pont Neuf", address: "12 rue du Pont Neuf 75001, Paris")
Pharmacy.create!(name: "Pharmacie Bastille", address: "1 rue des Tournelles 75004, Paris")
Pharmacy.create!(name: "Pharmacie Première", address: "24 boulevard Sébastopol 75004, Paris")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")
Pharmacy.create!(name: "", address: "")


prescription_item_1 = PrescriptionItem.create!(prescription_id: prescription_6.id, posology: "2 fois par jour pendant 5 jours", item_id: Item.find_by(name: 'ABRAXANE 5 mg/ml').id)
prescription_item_2 = PrescriptionItem.create!(prescription_id: prescription_6.id, posology: "3 fois par jour pendant 5 jours", item_id: Item.find_by(name: "ABILIFY 15 mg").id)
prescription_item_3 = PrescriptionItem.create!(prescription_id: prescription_6.id, posology: "1 fois par jour pendant 5 jours", item_id: Item.find_by(name: "ABIES NIGRA BOIRON").id)


item_1 = Item.create!(name: 'Doliprane 1000mg', desc: 'comprimé', administration: 'orale', price: 3, drug: false)
doliprane = URI.open('https://www.soin-et-nature.com/7446-menu_default/doliprane-1-000mg-comprimes-8.jpg')
item_1.photo.attach(io: doliprane, filename: "doliprane.jpg", content_type: "image/jpg")

item_2 = Item.create!(name: 'Baume Lèvres Certifié BIO', desc: '', administration: '', price: 6, drug: false)
baume = URI.open('https://mklgreennature.com/338/baume-levres-aloe-vera-bio.jpg')
item_2.photo.attach(io: baume, filename: "baume.jpg", content_type: "image/jpg")

item_3 = Item.create!(name: "Papier d'Arménie", desc: "", administration: '', price: 3, drug: false)
papier = URI.open('https://cdn.laredoute.com/products/5/c/c/5cc551444cdcd9af6d93dafce9071818.jpg?width=800&dpr=1')
item_3.photo.attach(io: papier, filename: "papier.jpg", content_type: "image/jpg")

item_4 = Item.create!(name: 'Compeed', desc: '', administration: '', price: 8, drug: false)
compeed = URI.open('https://www.pharmacie-prado-mermoz.com/client/840002/media/files/COMPEED-Pansements-ampoules-assortiment-45313_101_1609927632.jpg')
item_4.photo.attach(io: compeed, filename: "compeed.jpg", content_type: "image/jpg")

item_5 = Item.create!(name: 'Ricola', desc: '', administration: '', price: 3, drug: false)
ricola = URI.open('https://www.top-bonbon.com/487-large_default/ricola-cranberry-10-pieces.jpg')
item_5.photo.attach(io: ricola, filename: "ricola.jpg", content_type: "image/jpg")

item_6 = Item.create!(name: 'Mastic Gum', desc: 'Chewing-gum anti-tarte', administration: '', price: 3, drug: false)
gum = URI.open('https://www.super-smart.eu/data/articles/0207.webp?u=1652694602')
item_6.photo.attach(io: gum, filename: "gum.jpg", content_type: "image/jpg")

item_7 = Item.create!(name: 'Alvityl', desc: '', administration: '', price: 16, drug: false)
alvityl = URI.open('https://www.pharma-medicaments.com/wp-content/uploads/2022/01/4555344.jpg')
item_7.photo.attach(io: alvityl, filename: "alvityl.jpg", content_type: "image/jpg")

item_8 = Item.create!(name: 'Vitamine C', desc: '', administration: '', price: 12, drug: false)
vitamine = URI.open('https://pharmacie-citypharma.fr/200843-large_default/vitamine-c-upsa-1000-mg-20-comprimes-effervescents.jpg')
item_8.photo.attach(io: vitamine, filename: "vitamine.jpg", content_type: "image/jpg")

item_9 = Item.create!(name: 'Guronsan', desc: '', administration: '', price: 15, drug: false)
guronsan = URI.open('https://www.mon-pharmacien-conseil.com/10406-home_default/guronsan-30-comprimes-effervescents.jpg')
item_9.photo.attach(io: guronsan, filename: "guronsan.jpg", content_type: "image/jpg")

item_10 = Item.create!(name: 'Brosse à dents électrique', desc: '', administration: '', price: 40, drug: false)
brosse = URI.open('https://universpharmacie.fr/14000-home_default/oral-b-brosse-a-dents-electrique-soin-gencives-2.jpg')
item_10.photo.attach(io: brosse, filename: "brosse.jpg", content_type: "image/jpg")

item_11 = Item.create!(name: 'Savon surgras', desc: '', administration: '', price: 5, drug: false)
savon = URI.open('https://www.inenuy.fr/268-3625-large_default/savon-acne-surgras-doux-100-gr-peau-grasse-et-imperfections.jpg')
item_11.photo.attach(io: savon, filename: "savon.jpg", content_type: "image/jpg")

item_12 = Item.create!(name: 'Novanuit', desc: '', administration: '', price: 12, drug: false)
novanuit = URI.open('https://www.europe-pharma.com/46702/novanuit-triple-action-cpr-b-30.jpg')
item_12.photo.attach(io: novanuit, filename: "novanuit.jpg", content_type: "image/jpg")

item_13 = Item.create!(name: 'Charbon végétal', desc: '', administration: '', price: 14, drug: false)
charbon = URI.open('https://media.carrefour.fr/medias/5a029262591c380385ac25d5dd321610/p_540x540/bd46c30abafe443981544b94fbb249a2-image.jpg')
item_13.photo.attach(io: charbon, filename: "charbon.jpg", content_type: "image/jpg")

item_14 = Item.create!(name: 'Sédorrhoïde', desc: '', administration: '', price: 4, drug: false)
sedo = URI.open('https://moncoinsante.com/mcs/66339-large_default/sedorrhoide-suppositoire-crise-hemorroidaire-boite-de-8.jpg')
item_14.photo.attach(io: sedo, filename: "sedo.jpg", content_type: "image/jpg")

item_15 = Item.create!(name: 'Magnésium', desc: '', administration: '', price: 6, drug: false)
magnesium = URI.open('https://pharmacie-citypharma.fr/178490-large_default/mag-2-magnesium-marin-nervosite-fatigue-boite-30-ampoules.jpg')
item_15.photo.attach(io: magnesium, filename: "magnesium.jpg", content_type: "image/jpg")
