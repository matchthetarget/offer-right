namespace :dev do
  desc "Pre-populate database with dummy data"
  task prime: :environment do
    User.destroy_all
    users = [
      {id: 81, name: "alice", email: "alice@example.com", created_at: "2014-09-23 01:03:23", updated_at: "2019-10-08 10:25:00"},
      {id: 82, name: "judith", email: "judith@example.com", created_at: "2014-08-02 12:55:21", updated_at: "2019-10-08 10:25:00"},
      {id: 83, name: "bob", email: "bob@example.com", created_at: "2018-03-05 07:37:08", updated_at: "2019-10-08 10:25:00"},
      {id: 84, name: "carol", email: "carol@example.com", created_at: "2015-05-29 04:13:06", updated_at: "2019-10-08 10:25:00"},
      {id: 85, name: "osi", email: "osi@example.com", created_at: "2015-05-29 04:13:06", updated_at: "2019-10-08 10:25:00"}
    ]
    User.insert_all!(users)

    if User.method_defined?(:password) || User.has_attribute?(:password_digest)
      User.find_each do |user|
        user.password = "password"
        user.save
      end
      puts "Found a password column. Added passwords."
    end
    puts "There are #{User.count} users in the database"

    Category.destroy_all
    categories = [
      { id: 1, name: "Kitchen", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
      { id: 2, name: "Living Room", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
      { id: 3, name: "Bedroom", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
      { id: 4, name: "Decorations", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
      { id: 5, name: "Dining room", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
      { id: 6, name: "Miscellaneous", created_at: "2015-05-29 04:13:06", updated_at: "2015-05-29 04:13:06" },
    ]
    Category.insert_all!(categories)
    puts "There are #{Category.count} categories in the database"

    Item.destroy_all
    items = [
      { id: 1, category_id: 6, title: "Two Wood and Metal Chairs", price: 15, location: "Engelhart Hall", seller_id: 82, buyer_id: nil, image: "http://res-1.cloudinary.com/initialversion/image/upload/v1637079177/nquaxmvv2g1myn8h8m4l.jpg", description: "Two STURDY chairs. Wood Seats and Backs. Metal legs. Farmhouse Style. Previously school chairs. Could be for children's desk.", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 2, category_id: 2, title: "Contemporary White Upholstered Sofa Medium Firmness", location: "Engelhart Hall", price: 200, image: "https://res-1.cloudinary.com/initialversion/image/upload/v1637079178/tikxe2wqhdtcubvkh8uv.jpg", seller_id: 83, buyer_id: nil, description: "It measures 78” across outside the arms, 64” inside them, 40” deep, 36” tall at the back, and the seat height is 18-1/2”. Condition is excellent with no rips tears or stains. Delivery available please message for quote.", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 3, category_id: 2, title: "Heavy Iron & Glass Round Table", price: 129, location: "THE MCMANUS CENTER ", seller_id: 83, buyer_id: nil, image: "https://res-1.cloudinary.com/initialversion/image/upload/v1637079178/tikxe2wqhdtcubvkh8uv.jpg", description: "30\" diameter x 16\"h", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 4, category_id: 2, title: "Vintage Hardwood Coffee Table Unique Base Design", price: 40, location: "Garrett Place Apartments Northwestern University, Evanston, IL", seller_id: 81, buyer_id: nil, image: "http://res-3.cloudinary.com/initialversion/image/upload/v1637079180/wf19iybzca07bptqrefp.jpg", description: "It measures 48” x 23” x 17-1/2” and is in excellent condition with minimal surface wear. Delivery available please message for quote.", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 5, category_id: 3, title: "Sturdy Wood DESK w/drawers for storage", price: 40, location: "THE MCMANUS CENTER ", seller_id: 81, buyer_id: nil, image: "http://res-5.cloudinary.com/initialversion/image/upload/v1637079181/ldycsf2tzqi99utdrenp.jpg", description: "This wood desk can be painted white oe any color to customize as your preference. I This classic desk has a top pull out drawer as well as two side drawers. Only asking $40 or best offer!!!", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 6, category_id: 3, title: "Antique Vintage Wood Bedroom dresser Chest with drawers handmade furniture ", price: 150, location: "Garrett Place Apartments Northwestern University, Evanston, IL", seller_id: 83, buyer_id: nil, image: "http://res-4.cloudinary.com/initialversion/image/upload/v1637079182/drpyhu1edfmrfmxqznlm.jpg", description: "Beautiful Antique Bedroom Chest with lots of nice details. Handmade piece of furniture. Intricate brass handles. Carved solid Cherry wood. This piece is signed by a craftsman Henry Link Handle on the bottom drawer is broken, but you can find a replacement handle on etsy or EBay, or antique store. I have seen them. Measurements : 33 Wide x 19 Deep x 46 Tall See pictures to appreciate the beauty of this Piece of furniture. I am moving to a smaller space, so have to let it go Serious buyers only. Please, don't e-mail asking if the item is still available. Send a time & day you'd like to look at it etc.", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 7, category_id: 5, title: "3 bar chairs", price: 45, location: "THE MCMANUS CENTER ", seller_id: 81, buyer_id: 85, image: "https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043548/3f70e4fd-4ecc-45f1-ab15-3d66fb0bd0be_largesize.jpg", description: "Three bar chairs Black frames w/ black leather type seat coverings Two chairs have a worn corner in the seat covering. Sold only as a set of three chairs. seat is 24\" off the floor Top of back of chair is 42\" off the floor", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 8, category_id: 4, title: "Framed Tarkey print", price: 150, location: "THE MCMANUS CENTER ", seller_id: 82, buyer_id: 81, image: "https://images.craigslist.org/00101_92MqrozJPzPz_0t20CI_600x450.jpg", description: "Tarkey print double matted in beautiful wood frame in antique gold finish 31\"wide x 42\" high", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 9, category_id: 5, title: "console cabinet", price: 800, location: "THE MCMANUS CENTER ", seller_id: 83, buyer_id: 82, image: "https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043577/51114273cf065a2d63c5a3cbedd12942.jpg", description: "Horchow Solid wood distressed turquoise cabinet 20\”D x 27\”H x 77\”L", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 10, category_id: 1, title: "5-foot kitchen oval table", price: 100, location: "THE MCMANUS CENTER ", seller_id: 84, buyer_id: 85, image: "https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043609/aa5c9a57c09b7dc227bdf9839254b948.jpg", description: "5-foot kitchen oval table with a 2-foot leaf and 6-chairs let me know asap ", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 11, category_id: 3, title: "11 Inch Queen Size Gel Memory Foam Mattress With Zipper ", price: 178, location: "THE MCMANUS CENTER ", seller_id: 85, buyer_id: nil, image: "http://res-4.cloudinary.com/initialversion/image/upload/v1637079184/rfgqc3efouajdcl3oule.jpg", description: "Size: Queen Thickness: 11 in Length: 76 in Width: 66 in Color: White Features: Adjustable, Memory Foam Layer, Pressure Release, Washable, With Zipper", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      { id: 12, category_id: 6, title: "HERMAN MILLER AERON SIZE B FULLY ADJUSTABLE ERGONOMIC CHAIRS ", price: 400, location: "THE MCMANUS CENTER ", seller_id: 85, buyer_id: nil, image: "http://res-1.cloudinary.com/initialversion/image/upload/v1637079185/y3wd7o3xbwfgqurqei9r.jpg", description: "THESE ARE REFURBISHED HERMAN MILLER (AERON) CHAIRS AVAILABLE IN BLACK AND BLUE MESH ON GRAPHITE FRAME AND BASE. FULLY ADJUSTABLE. FULLY ADJUSTABLE VINYL ARM PADS. FULLY ADJUSTABLE LUMBAR SUPPORT PAD. REAR AND FORWARD TILT LOCK LIMITERS.", created_at: Faker::Time.between(from: 1.year.ago, to: DateTime.now) },
      {:id=>13, :title=>"Mandolorian skillet", :price=>10.0, :seller_id=>84, :description=>"New in box comes with pancake mix", :category_id=>1, :location=>"Hawkins lane near Burr", :buyer_id=>nil, :image=>"https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043517/skillet__71600.1626287405.jpg"},
      {:id=>14, :title=>"Basket, Longaberger Tea with Protector and Liner", :price=>15.0, :seller_id=>83, :description=>"Basket in like new condition.", :category_id=>1, :location=>"300 Apple River Dr", :buyer_id=>nil, :image=>"https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043435/il_794xN.1509026284_srb8.jpg" },
      {:id=>15, :title=>"Heart measuring spoons", :price=>6.0, :seller_id=>85, :description=>"I have 4 sets nice gift new on box", :category_id=>1, :location=>"Hawkins lane near Burr", :buyer_id=>nil, :image=>"https://res.cloudinary.com/dt1gn6erd/image/upload/v1645043643/iipsrv.fcgi.jpg"}
    ]
    items.each do |i|
      c = Item.create(i)
      image = i[:image]
      begin
        file = URI.open(image)
        c.image = file
        c.save
        # p c.errors.full_messages
      rescue => exception
        puts "_____\n\n"
        p c.title
        p image
        puts "_____\n\n"
      end
    end
    puts "There are #{Item.count} items in the database"
    
    messages = [
      { id: 1, sender_id: 81, recipient_id: 82, item_id: 8, body: "This looks great! Is it still available?"},
      { id: 2, sender_id: 82, recipient_id: 81, item_id: 8, body: "Thank you. It is still available. Are you interested?"},
      { id: 3, sender_id: 81, recipient_id: 82, item_id: 8, body: "I am! Can I swing by one Tuesday?"},
      { id: 4, sender_id: 82, recipient_id: 81, item_id: 8, body: "sure"},
      { id: 5, sender_id: 85, recipient_id: 82, item_id: 8, body: "Is this still available?"},
      { id: 6, sender_id: 82, recipient_id: 85, item_id: 8, body: "Sorry. Just sold this morning."},
      { id: 7, sender_id: 85, recipient_id: 84 , item_id: 10, body: "When's a good time to do the exhange?" },
      { id: 8, sender_id: 84, recipient_id: 85 , item_id: 10, body: "Can you text me? My number is 812-919-9213." },
      { id: 9, sender_id: 82, recipient_id: 83 , item_id: 9, body: "I live nearby. Can we meet up around noon?" },
      { id: 10, sender_id: 81, recipient_id: 84, item_id: 10, body: "Are you flexible on the price?"},
    ]
    
    Message.create(messages)
    puts "There are #{Message.count} Messages in the database"

  end
end
