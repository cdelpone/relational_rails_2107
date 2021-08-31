# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Scotch.destroy_all
Distillery.destroy_all

@distillery_1 = Distillery.create!({
                                name: "Ardbeg",
                                established: 1815,
                                scotland_location: true,
                                updated_at: '2021-08-26 01:20:17 UTC',
                                created_at: '2021-08-25 16:34:12 UTC',
                                id: 1
                                })
@distillery_6 = Distillery.create!({
                                name: "Laphroaig",
                                established: 1815,
                                scotland_location: true,
                                updated_at: '2021-08-26 00:06:30 UTC',
                                created_at: '2021-08-26 00:06:30 UTC',
                                id: 6
                                })
@distillery_7 = Distillery.create!({
                                name: "Bowmore",
                                established: 1779,
                                scotland_location: 'true',
                                updated_at: '2021-08-26 01:11:07 UTC',
                                created_at: '2021-08-26 01:11:07 UTC',
                                id: 7
                                })
@scotch_1 = Scotch.create!({
                                name: "An OA",
                                single_malt: true,
                                year: 15,
                                updated_at: '2021-08-26 18:00:40 UTC',
                                created_at: '2021-08-26 18:00:40 UTC',
                                distillery_id: 1,
                                id: 1
                                })
@scotch_2 = Scotch.create!({
                                name: "Bowmore 10 yr",
                                single_malt: true,
                                year: 10,
                                updated_at: '2021-08-26 20:10:37 UTC',
                                created_at: '2021-08-26 20:10:37 UTC',
                                distillery_id: 7,
                                id: 2
                                })
@scotch_3 = Scotch.create!({
                                name: "Bowmore 12 yr",
                                single_malt: true,
                                year: 12,
                                updated_at: '2021-08-26 21:34:25 UTC',
                                created_at: '2021-08-26 21:34:25 UTC',
                                distillery_id: 7,
                                id: 3
                                })
