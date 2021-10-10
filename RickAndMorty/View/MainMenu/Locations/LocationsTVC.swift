import UIKit

class LocationsTVC: UITableViewController {
  let networkService = NetworkServiceLocation()
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(urlString: urlStringLocation) { [weak self] result in
      switch result {
      case .success(let welcome):
      modelLocation = welcome
      self?.tableView.reloadData()
      case .failure(let error):
      print("Error:", error)
      }
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelLocation?.results.count ?? 1
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as?
LocationsCell else { return UITableViewCell() }
  let data = modelLocation?.results[indexPath.row]
    cell.locationLabel.text = data?.name
    return cell
  }
}
