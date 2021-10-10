import Foundation
import UIKit

class NetworkService {
  func request(urlString: String, completion: @escaping (Result<Characters, Error>) -> Void) {
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
          let characters = try JSONDecoder().decode(Characters.self, from: data)
          completion(.success(characters))
        } catch let jsonError {
          print("Failed to decode JSON", jsonError)
          completion(.failure(jsonError))
        }
      }
    }
    .resume()
  }

  func setImage(strImage: String, cell: CharacterCell) {
    if let urlImage = URL(string: strImage) {
      let task = URLSession.shared.dataTask(with: urlImage) { data, _, _ in
        guard let data = data else { return }
        DispatchQueue.main.async {
          cell.characterImage.image = UIImage(data: data)
        }
      }
      task.resume()
    }
  }
}
