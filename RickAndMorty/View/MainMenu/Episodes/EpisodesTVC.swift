import UIKit

class EpisodesTVC: UITableViewController {
  let networkService = NetworkServiceEpisode()
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(urlString: urlStringEpisode) { [weak self] result in
      switch result {
      case .success(let welcome):
      modelEpisode = welcome
      self?.tableView.reloadData()
      case .failure(let error):
      print("Error:", error)
      }
    }
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelEpisode?.results.count ?? 1
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as?
EpisodesCell else { return UITableViewCell() }
  let data = modelEpisode?.results[indexPath.row]
    cell.episodeLabel.text = data?.name
    cell.infoEpisodeLabel.text = "Season 1, Episode \(data?.id ?? 0)"
    return cell
  }
}
