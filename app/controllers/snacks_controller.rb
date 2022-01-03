class SnacksController < ApplicationController
	def show
		snack = {
			id: 1,
			name: "Club Bloom", 
			formatted_address: "東京都台東区上野２丁目８−７ SEIKAビル ２F",
			vicinity:  "台東区上野２丁目８−７ SEIKAビル ２F", 
			rating: "3.5", 
			phone_number: "03-3837-2580", 
			weekday_text: [
				"月曜日: 20時00分～21時00分",
				"火曜日: 20時00分～21時00分",
				"水曜日: 20時00分～21時00分",
				"木曜日: 20時00分～21時00分",
				"金曜日: 20時00分～21時00分",
				"土曜日: 20時00分～21時00分",
				"日曜日: 定休日"
			],
			reviews: [
				{
					author_name: "Masamichi Hori",
					author_url: "https://www.google.com/maps/contrib/102523029240399166745/reviews",
					language: "ja",
					profile_photo_url: "https://lh3.googleusercontent.com/a-/AOh14GgsuLRn5vC1D8MycDjKX_ovneyyeKnKK3ORvklFkw=s128-c0x00000000-cc-rp-mo-ba3",
					rating: 5,
					relative_time_description: "1 年前",
					text: "ママもいい人だし、他の働いている方たちもいい人で、とても寛げます🎵",
					time: 1573915807
				},
				{
					author_name: "千秋町芝原五十分山本",
					author_url: "https://www.google.com/maps/contrib/109196519071481755410/reviews",
					profile_photo_url: "https://lh3.googleusercontent.com/a/AATXAJy0QQmuefXAUWvhcA9qiEP9k-yo8RUKuOXVNZNY=s128-c0x00000000-cc-rp-mo",
					rating: 4,
					relative_time_description: "4 年前",
					text: "",
					time: 1504081833
				},
				{
					author_name: "佐藤健",
					author_url: "https://www.google.com/maps/contrib/117265385591472173882/reviews",
					profile_photo_url: "https://lh3.googleusercontent.com/a/AATXAJwnbUR5wEs_zmDJxsdUaPQf9PSuKT4RzpqmdnCi=s128-c0x00000000-cc-rp-mo-ba3",
					rating: 2,
					relative_time_description: "1 年前",
					text: "",
					time: 1592819411
				},
				{
					author_name: "m s",
					author_url: "https://www.google.com/maps/contrib/108819904588477910880/reviews",
					profile_photo_url: "https://lh3.googleusercontent.com/a/AATXAJyZEvtusK0uHXeY14ZivtqBZTG8s2txSNpDRmHv=s128-c0x00000000-cc-rp-mo",
					rating: 5,
					relative_time_description: "2 年前",
					text: "",
					time: 1543425201
				},
				{
					author_name: "竹澤朋英",
					author_url: "https://www.google.com/maps/contrib/104404093859713504949/reviews",
					profile_photo_url: "https://lh3.googleusercontent.com/a/AATXAJweN3c39H-oAZmq-9YaCiZen7IqfuXrH0gDxunF=s128-c0x00000000-cc-rp-mo-ba3",
					rating: 3,
					relative_time_description: "2 年前",
					text: "",
					time: 1564584912
				}
			],
			"user_ratings_total": 5,
			map_url: "https://maps.google.com/?cid=11866674382407143631", 
			website: "https://fujisandararara.wixsite.com/junko-uenoten",
			photo_reference: "Aap_uEDuA8UvMaS4-GIIvySdYAvxF4L1cI5cBBQmn9L6JquGs3EuEkDj8yU3NGSL9N8Zy1wQsKpHeDCrrruRMdOKjB5eBkmbIwCrUtTDVSLyWVWGBwMhY-2jZyo1eKVKqPVYFo3nX_f6zzi5_wK39CZF9MJ8BU5c6NPl0EJrUs35kaS-Sjgy",
		}

		render json: snack, status: :ok
	end

	def s3_direct_post
		resource = S3_BUCKET.presigned_post(key: "<アップロードするディレクトリのpath>/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read', content_length_range: 1..(10.megabytes))
		render json: { url: resource.url, fields: resource.fields }
	end

	def open_url
		require 'open-uri'
		# url = "https://www.snakaranavi.net/shop.php?sno=7545"
		url = "https://www.snakaranavi.net/list.php?type=area&pno=13&pref=%E6%9D%B1%E4%BA%AC%E9%83%BD&aid=1317&area=%E4%B8%8A%E9%87%8E%E3%83%BB%E6%B5%85%E8%8D%89%E3%83%BB%E6%97%A5%E6%9A%AE%E9%87%8C"
		charset = nil
		html = OpenURI.open_uri(url) do |f|
						charset = f.charset
						f.read
					end
		doc = Nokogiri::HTML.parse(html, nil, charset)
		doc.xpath('//li[@class="shop_box"]')
	end

	def parse_html
	end
end