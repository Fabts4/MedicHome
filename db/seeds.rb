require "csv"
require "open-uri"

filepath = "storage/items.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  Item.create(name: row[0], desc: row[1], administration: row[2], price: 0)
end
Item.all

doc_knock = Doctor.create!(email: 'docknock@gmail.com', encrypted_password: 'azerty', first_name: 'Docteur', last_name: 'Knock', address: '3 rue le Goff', ssn: '14701126747696', mutuelle_name:'Lidl', mutuelle_number: '0000836439', rpps: '17459398274', doctor: true )
doc_oc = Doctor.create!(email: 'dococ@gmail.com', encrypted_password: 'azerty', first_name: 'Docteur', last_name: 'Oc', address: '12 avenue de la Grande Armée', ssn: '17723066749696', mutuelle_name:'Osborne.Corp', mutuelle_number: '0000572942', rpps: '18153865409', doctor: true )

michel = Patient.create!(email: 'michel@gmail.com', encrypted_password: 'azerty', first_name: 'Michel', last_name: 'Berger', address: '42 boulevard Raspail', ssn: '17723066749696', mutuelle_name:'Mutuelle', mutuelle_number: '0000572942', rpps: '', doctor: false )
georges = Patient.create!(email: 'bernard@gmail.com', encrypted_password: 'azerty', first_name: 'Georges', last_name: 'Moustaki', address: '76 rue de Vaugirard', ssn: '17723066749696', mutuelle_name:'Mutuelle', mutuelle_number: '0000572942', rpps: '', doctor: false )

prescription_1 = Prescription.create!(date: '06/03/2023', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_2 = Prescription.create!(date: '14/01/2022', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_3 = Prescription.create!(date: '30/08/2021', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_4 = Prescription.create!(date: '22/01/2020', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_5 = Prescription.create!(date: '29/02/2018', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_6 = Prescription.create!(date: '12/07/2022', status: 1, doctor_id: doc_knock.id, patient_id: michel.id)
prescription_7 = Prescription.create!(date: '14/07/2018', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)
prescription_8 = Prescription.create!(date: '31/05/2020', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)
prescription_9 = Prescription.create!(date: '30/11/2019', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)
prescription_10 = Prescription.create!(date: '15/09/2022', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)
prescription_11 = Prescription.create!(date: '25/12/2020', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)
prescription_12 = Prescription.create!(date: '11/04/2013', status: 1, doctor_id: doc_oc.id, patient_id: georges.id)

pharmacy_1 = Pharmacy.create!(name: 'PharmacisileS', address: '16 villa Gaudelet')
pharmacy_2 = Pharmacy.create!(name: 'Pharmatop', address: '48 boulevard Raspail ')
pharmacy_3 = Pharmacy.create!(name: 'Pharmapastop', address: '2 rue Malebranche')
pharmacy_4 = Pharmacy.create!(name: 'Pharmasifreddi', address: '3 rue des Petites Ecuries')
pharmacy_5 = Pharmacy.create!(name: 'Pharmacorp', address: '67 boulevard Saint-Germain')
pharmacy_6 = Pharmacy.create!(name: 'PhOmarSy', address: '15 rue Oberkampf')
pharmacy_7 = Pharmacy.create!(name: 'Pharmaté', address: '42 rue de Grenelle')
pharmacy_8 = Pharmacy.create!(name: 'Pharmapop', address: '4 rue Cail')
pharmacy_9 = Pharmacy.create!(name: 'Pharmol', address: '1 rue Caillou Mérard')
pharmacy_10 = Pharmacy.create!(name: 'Pharniente', address: '4 boulevard des Italiens')

item_1 = Item.create!(name: 'Belpô', desc: 'Crème de jour', administration: '', price: 15, drug: false)
item_2 = Item.create!(name: 'Levredouces', desc: 'Beaume à lèvres', administration: '', price: 6, drug: false)
item_3 = Item.create!(name: "Armenia", desc: "Papier d'Arménie", administration: '', price: 3, drug: false)
item_4 = Item.create!(name: 'Compeed', desc: 'Patch pour ampoules', administration: '', price: 8, drug: false)
item_5 = Item.create!(name: 'Ricola', desc: 'Pastilles sans sucres Suisse', administration: '', price: 3, drug: false)
item_6 = Item.create!(name: 'Denblanche', desc: 'Chewing-gum anti-tarte', administration: '', price: 3, drug: false)
item_7 = Item.create!(name: 'Aaze', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_8 = Item.create!(name: 'Arty', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_9 = Item.create!(name: 'Auio', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_10 = Item.create!(name: 'Apml', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_11 = Item.create!(name: 'Akjh', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_12 = Item.create!(name: 'Agfd', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_13 = Item.create!(name: 'Asqw', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_14 = Item.create!(name: 'Axcv', desc: 'achète-le!', administration: '', price: 1, drug: false)
item_15 = Item.create!(name: 'Abn', desc: 'achète-le!', administration: '', price: 1, drug: false)
