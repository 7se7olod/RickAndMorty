import UIKit

class FavouritesTVC: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 0
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath)
    return cell
  }
}
