import Foundation
import UIKit

let urlStringEpisode = "https://rickandmortyapi.com/api/episode"
let urlStringCharacter = "https://rickandmortyapi.com/api/character"
let urlStringLocation = "https://rickandmortyapi.com/api/location"
let networkService = NetworkService()

class NetworkService {
  func request<T: Codable>(res: T, urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
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
            let characters = try JSONDecoder().decode(T.self, from: data)
            completion(.success(characters))
          } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            completion(.failure(jsonError))
          }
        }
      }
      .resume()
    }

  func setImage(strImage: String, image: UIImageView) -> UIImage {
    if let urlImage = URL(string: strImage) {
      let task = URLSession.shared.dataTask(with: urlImage) { data, _, _ in
        guard let data = data else { return }
        DispatchQueue.main.async {
          image.image = UIImage(data: data)
        }
      }
      task.resume()
    }
    return image.image ?? UIImage()
  }
}
