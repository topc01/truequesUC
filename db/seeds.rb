# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USO
Category.create(name: "Exteriores", description: "para exteriores")
Category.create(name: "Interiores", description: "para interiores")

# ORIGEN
Category.create(name: "Artesanal", description: "artesanales")
Category.create(name: "Industrial", description: "industriales")

# MATERIALES
Category.create(name: "Madera", description: "de madera")
Category.create(name: "Metal", description: "de metal")
Category.create(name: "Plástico", description: "de plástico")
Category.create(name: "Cuero", description: "de cuero")
Category.create(name: "Mimbre", description: "de mimbre")

# TIPO
Category.create(name: "Mesa", description: "mesas")
Category.create(name: "Silla", description: "sillas")
Category.create(name: "Sofá", description: "sofás")
Category.create(name: "Cama", description: "camas")
Category.create(name: "Lámpara", description: "lámparas")
Category.create(name: "Escritorio", description: "mesas de escritorio")
Category.create(name: "Comoda", description: "comodas")
Category.create(name: "Closet", description: "closets")
