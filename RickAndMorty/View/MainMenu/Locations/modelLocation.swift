import Foundation
let urlStringLocation = "https://rickandmortyapi.com/api/location"
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

class NetworkServiceLocation {
  func request(urlString: String, completion: @escaping (Result<Locations, Error>) -> Void) {
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
          let characters = try JSONDecoder().decode(Locations.self, from: data)
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
