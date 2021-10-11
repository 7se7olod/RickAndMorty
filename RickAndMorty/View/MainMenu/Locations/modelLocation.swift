import Foundation

var modelLocation: Locations?

struct Locations: Codable {
  let results: [ResultLocation]
}

struct ResultLocation: Codable {
  let id: Int?
  let name, type, dimension: String?
  let residents: [String]?
  let url: String?
  let created: String?
}
