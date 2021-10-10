import Foundation
let urlStringEpisode = "https://rickandmortyapi.com/api/episode"
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

class NetworkServiceEpisode {
  func request(urlString: String, completion: @escaping (Result<Episodes, Error>) -> Void) {
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, _, error in
      DispatchQueue.main.async {
        if let error = error {
          print("Some error")
          completion(.failure(error))
          return
        }
        guard let data = data else { return }
        do {
          let characters = try JSONDecoder().decode(Episodes.self, from: data)
          completion(.success(characters))
        } catch let jsonError {
          print("Failed to decode JSON", jsonError)
          completion(.failure(jsonError))
        }
      }
    }
    .resume()
  }
}
