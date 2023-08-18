# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
consoles_data = [
  {
    name: "Playstation 5",
    purchase_price: 499.99,
    rental_price: 50,
    description: "Playstation 5. The PS5 Console unleashes new gaming possibilities that you never anticipated.",
    photo: "https://koodoo.co.za/cdn/shop/products/PS5-Console_1200x1200.png?v=1648135334"
  },
  {
    name: "Xbox Series X",
    purchase_price: 549.99,
    rental_price: 55,
    description: "Xbox Series X. Experience next-gen speed and performance like never before.",
    photo: "https://media.ldlc.com/r1600/ld/products/00/05/74/94/LD0005749420_1.jpg"
  },
  {
    name: "Nintendo Switch",
    purchase_price: 299.99,
    rental_price: 40,
    description: "Nintendo Switch. Play games anytime, anywhere with the versatile Nintendo Switch.",
    photo: "https://fs-prod-cdn.nintendo-europe.com/media/images/08_content_images/systems_5/nintendo_switch_3/not_approved_1/NSwitchTop.png"
  },
  {
    name: "Sony PlayStation 4",
    purchase_price: 299.99,
    rental_price: 30,
    description: "Sony PlayStation 4. Enjoy a vast library of games on the PS4.",
    photo: "https://level-1.fr/Principal/wp-content/uploads/2021/01/playstation-4-hits-40-million-units-sold_6ac6.1200.jpg"
  },
  {
    name: "Xbox One X",
    purchase_price: 399.99,
    rental_price: 45,
    description: "Xbox One X. Immerse yourself in true 4K gaming on the Xbox One X.",
    photo: "https://m.media-amazon.com/images/I/61fnlzj1ERL.jpg"
  },
  {
    name: "Nintendo Switch Lite",
    purchase_price: 199.99,
    rental_price: 25,
    description: "Nintendo Switch Lite. A compact and lightweight version of the Nintendo Switch.",
    photo: "https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg"
  },
  {
    name: "Sony PlayStation 3",
    purchase_price: 199.99,
    rental_price: 20,
    description: "Sony PlayStation 3. Rediscover classic games on the PS3.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/PS3Versions.png/800px-PS3Versions.png"
  },
  {
    name: "Xbox One S",
    purchase_price: 299.99,
    rental_price: 35,
    description: "Xbox One S. Play the latest Xbox games in stunning 4K resolution.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/8/82/Microsoft-Xbox-One-S-Console-wController-L.jpg"
  },
  {
    name: "Nintendo 3DS",
    purchase_price: 149.99,
    rental_price: 15,
    description: "Nintendo 3DS. Experience 3D gaming on the go with the Nintendo 3DS.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Nintendo-3DS-AquaOpen.png/800px-Nintendo-3DS-AquaOpen.png"
  },
  {
    name: "Sony PlayStation Portable",
    purchase_price: 129.99,
    rental_price: 10,
    description: "Sony PlayStation Portable. Play games and watch movies on the PSP.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Psp-1000.jpg/800px-Psp-1000.jpg"
  }
]

consoles_data.each do |console_data|
  Console.create(console_data)
end
