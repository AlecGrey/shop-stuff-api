# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ~~ THIS IS A LONG SEEDING PROCESS AS IT MAKES MANY REQUESTS TO THE ETSY API ~~ #

max_taxonomy = 1484
items = []

until Item.all.length == 100 do

    data = RestClient.get("https://openapi.etsy.com/v2/listings/active?taxonomy_id=#{rand(1..max_taxonomy)}&api_key=KEY")
    json = JSON.parse(data)

    if json['count'] != 0 
        etsy_item = json['results'][rand(0...json['results'].length)]

        data = RestClient.get("https://openapi.etsy.com/v2/listings/#{etsy_item['listing_id']}/images?api_key=hpe7uoia9bb85qcm5gh459xq")
        json = JSON.parse(data)

        item_img_url = json['results'][0]['url_570xN']

        Item.create({
            name: etsy_item['title'],
            description: etsy_item['description'],
            price: etsy_item['price'].to_f,
            item_type: etsy_item['taxonomy_path'][0],
            img_url: item_img_url
        })
    end
end
