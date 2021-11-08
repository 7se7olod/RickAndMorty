import UIKit

class CharactersTVC: UITableViewController {
  @IBOutlet var searchBar: UISearchBar!
  let character: Characters? = nil
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(res: character, urlString: urlStringCharacter) { [weak self] result in
    switch result {
    case .success(let welcome):
    modelChar = welcome
    self?.tableView.reloadData()
    case .failure(let error):
    print("Error:", error)
    }
    }
}

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelChar?.results.count ?? 1
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as?
    CharacterCell else { return UITableViewCell() }
    let character = modelChar?.results[indexPath.row]
    cell.name.text = character?.name
    cell.characterStatus.text = character?.status
    let strImage = character?.image
    networkService.setImage(strImage: strImage ?? "", cell: cell)
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let detailCharacter = storyboard.instantiateViewController(identifier: "DetailCharacterTVC") as?
DetailCharacterTVC else { return }
show(detailCharacter, sender: nil)
  }
}
