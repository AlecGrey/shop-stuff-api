# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# max_taxonomy = 1484
# items = []

# until Item.all.length == 1000 do

#     data = RestClient.get("https://openapi.etsy.com/v2/listings/active?taxonomy_id=#{rand(1..max_taxonomy)}&api_key=hpe7uoia9bb85qcm5gh459xq")
#     json = JSON.parse(data)

#     if json['count'] != 0 
#         etsy_item = json['results'][rand(0...json['results'].length)]

#         data = RestClient.get("https://openapi.etsy.com/v2/listings/#{etsy_item['listing_id']}/images?api_key=hpe7uoia9bb85qcm5gh459xq")
#         json = JSON.parse(data)

#         item_img_url = json['results'][0]['url_570xN']

#         # items << below hash
#         Item.create({
#             name: etsy_item['title'],
#             description: etsy_item['description'],
#             price: etsy_item['price'].to_f,
#             item_type: etsy_item['taxonomy_path'][0],
#             img_url: item_img_url
#         })
#     end
# end

Score.destroy_all
User.destroy_all

cohort_names = [
    'Alex',
    'Amanda',
    'Clay',
    'Ellaine',
    'Hal',
    'Inee',
    'Jesse',
    'Kevin',
    'Kim',
    'Lantz',
    'Marisa',
    'Matty',
    'Michael',
    'Milan',
    'Rodrigo',
    'Stephen',
    'Tony',
    'Will L',
    'Will G'
]

names = []

until names.uniq.length == 5 do
    names << cohort_names.sample
end

unique_names = names.uniq

[500, 400, 350, 300, 250].each_with_index do |points, i|
    user = User.create(name: unique_names[i])
    Score.create(
        score: points, 
        user_id: user.id,
        name: user.name 
    )
end