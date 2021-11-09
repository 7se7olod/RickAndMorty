import UIKit

class CharactersTVC: UITableViewController {
  @IBOutlet var searchBar: UISearchBar!
  var character: Characters?
  var imageCharacter = UIImage()
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(res: character, urlString: urlStringCharacter) { [weak self] result in
    switch result {
    case .success(let welcome):
      self?.character = welcome
    self?.tableView.reloadData()
    case .failure(let error):
    print("Error:", error)
    }
    }
}

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.character?.results.count ?? 1
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "CharacterCell", for: indexPath
    ) as? CharacterCell else { return UITableViewCell() }
    if let character = self.character?.results[indexPath.row] {
      cell.setCell(character: character)
      let strImage = character.image
      self.imageCharacter = networkService.setImage(strImage: strImage, image: cell.characterImage)
      cell.characterImage.image = self.imageCharacter
    }
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let detailCharacter = storyboard.instantiateViewController(identifier: "DetailCharacterVC") as?
    DetailCharacterVC else { return }
    detailCharacter.detailCharacter = self.character?.results[indexPath.row]
    show(detailCharacter, sender: nil)
  }
}
