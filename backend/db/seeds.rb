# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

3.times do |n|
    MainTarget.create(target_main: "目標_#{n}")
end

2.times do |n| 
    user = User.new(
        name: "ニンゲン_#{n}" ,
        email: "fugaa#{n}@example.com",
        password: "foobar" ,
        password_confirmation: "foobar"
    )
    user.save!

    2.times do |n|
        a = user.main_targets.create!(
            target_main: "s",
            target_n: "s",
            target_ne: "s",
            target_e: "s",
            target_se: "s",
            target_s: "s",
            target_sw: "s",
            target_w: "s",
            target_nw: "s"
        )
        a.save!

        MainTarget.all.each do |i|
            SubTarget.create!(
                sub_target_n: "s",
                sub_target_ne: "s",
                sub_target_e: "s",
                sub_target_se: "s",
                sub_target_s: "s",
                sub_target_sw: "s",
                sub_target_w: "s",
                sub_target_nw: "s"
            )
        end
    end


end