import Foundation

var modelEpisode: Episodes?

struct Episodes: Codable {
  let results: [ResultEpisode]
}

struct ResultEpisode: Codable {
  let id: Int
  let name: String
  let airDate: String
  let episode: String
  let characters: [String]?
  let url: String?
  let created: String?
  enum CodingKeys: String, CodingKey {
    case id, name
    case airDate = "air_date"
    case episode, characters, url, created
  }
}
