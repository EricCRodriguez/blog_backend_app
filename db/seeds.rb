User.create!(name: "Test", email: "test@email.com", password: "password")

Post.create!(title: " Welcome", body: "Hello", image: "https://picsum.photos/id/#{rand(1000)}/300/300")
