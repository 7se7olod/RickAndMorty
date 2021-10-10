import Foundation
let urlStringCharacter = "https://rickandmortyapi.com/api/character"
var modelChar: Characters?

struct Characters: Codable {
  let results: [ResultCharacter]
}

struct ResultCharacter: Codable {
  let id: Int
  let name: String
  let status: String
  let species: Species
  let type: String
  let gender: Gender
  let origin, location: Location
  let image: String
  let episode: [String]
  let url: String
  let created: String
}

enum Gender: String, Codable {
  case female = "Female"
  case male = "Male"
  case unknown = "unknown"
}

struct Location: Codable {
  let name: String
  let url: String
}

enum Species: String, Codable {
  case alien = "Alien"
  case human = "Human"
}
