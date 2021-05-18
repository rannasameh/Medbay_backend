
speciality=["Allergists/Immunologists",
"Anesthesiologists",
"Cardiologists",
"Colon and Rectal Surgeons",
"Critical Care Medicine Specialists",
 " Dermatologists",
  "Diagnostic radiology",
 " Emergency medicine",
  "Endocrinologists",
 " Family medicine",
  "Gastroenterologists",
  "Geriatric Medicine Specialists",
  "Hematologists",
  "Hospice and Palliative Medicine Specialists",
  "Infectious Disease Specialists",
  "Nephrologists",
  "Medical genetics",
  "Neurology",
  "Obstetricians and Gynecologists",
  "Oncologists",
  "Ophthalmology",
  "Pathology",
  "Pediatrics",
  "Plastic Surgeons",
 " Physical medicine and rehabilitation",
  "Psychiatry",
  "Radiologists",
 " Surgery",
  "Urology"]

  city=["Cairo","Giza","Alexandria","Qalyubia", " Gharbia", " Menoufia","Fayoum", "El-Dakahlia", " El-Sharqia","El-Beheira",
  "Damietta", "Matrouh","Assiut","El-Ismailia","Hurghada","Sharm El Sheikh"," Portsaid"," Suez", " Sohag", "El-Minia"," Kafr El sheikh", " Luxor","Qena","Beni Suef"]

  200.times do 
    Patient.create(
        {
        email: Faker::Internet.free_email,
        first_name: Faker::Name.first_name ,
        last_name: Faker::Name.last_name ,
        date_of_birth: Faker::Date.between(from: '1960-09-23', to: '2001-09-23'),
        gender: Faker::Gender.type,
        street: Faker::Address.street_name, 
        building: Faker::Address.building_number,
        city: city.sample,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code, 
        country: Faker::Address.country,
        phone_number: Faker::PhoneNumber.cell_phone,
        marital_status: 'single',
        emergency_first_name: Faker::Name.first_name, 
        emergency_last_name: Faker::Name.last_name ,
        emergency_phone_number:Faker::PhoneNumber.cell_phone,
        height: Faker::Number.between(from: 150, to: 200),
        weight:Faker::Number.between(from: 30, to: 200),
        blood_type: Faker::Blood.type,
        family_allergies:'',
        family_diseaeses:'',
        password: '123456',
        password_confirmation: '123456',
        }
    )
    end

    200.times do 
        Doctor.create(
            {
     email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    date_of_birth: Faker::Date.between(from: '1960-09-23', to: '2001-09-23'),
    gender: Faker::Gender.type ,
    street: Faker::Address.street_name, 
    building: Faker::Address.building_number,
    city: city.sample,
    state: Faker::Address.state,
    zip_code: Faker::Address.zip_code, 
    country: Faker::Address.country,
    phone_number: Faker::PhoneNumber.cell_phone,
    marital_status: 'single',
    emergency_first_name: Faker::Name.first_name, 
    emergency_last_name: Faker::Name.last_name ,
    emergency_phone_number: Faker::PhoneNumber.cell_phone,
    password: '123456',
    password_confirmation: '123456',
    years_of_experience:Faker::Number.between(from: 1, to: 40 ),
    specialities: speciality.sample,
    clinic_street: Faker::Address.street_name, 
    clinic_building: Faker::Address.building_number,
    clinic_city: Faker::Address.city,
    clinic_state: Faker::Address.state,
    clinic_working_hours_from: Faker::Number.between(from: 1, to: 11 ),
    clinic_working_hours_to:  Faker::Number.between(from: 2, to: 12 ),
    clinic_phone_number: Faker::PhoneNumber.cell_phone,
    rating: Faker::Number.between(from: 1, to: 5 ),

            }
        )
        end



    
   
