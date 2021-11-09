import UIKit

class DetailCharacterVC: UIViewController {
  @IBOutlet var tableView: UITableView!
  @IBOutlet var view1: UIView!
  var detailCharacter: ResultCharacter?
  let headerSections: [String] = ["", "LOCATION", "EPISODES"]
  let sizeHeaderSection: [CGFloat] = [0, 30, 30]
  var data = [[String?]]()
  let header = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))

  private let labelName: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 30)
    return label
  }()
  private let labelFavourite: UILabel = {
    let label = UILabel()
    label.text = "Add to Favourite"
    return label
  }()
  private let buttonFavourite: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "no-favorite"), for: .normal)
    return button
  }()
  private var image: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 10, y: 10, width: 90, height: 90))
    image.layer.cornerRadius = image.frame.size.width / 2
    image.clipsToBounds = true
    return image
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    appendInfoInData()
    configureContents()
    constraintsForHeader()
    setImage()
  }

  private func appendInfoInData() {
    let status: String? = detailCharacter?.status
    let type: String? = detailCharacter?.type
    let gender: String? = detailCharacter?.gender.rawValue
    let date: String? = detailCharacter?.created
    let location: String? = detailCharacter?.location.name
    guard let episodes: [String] = detailCharacter?.episode else { return }
    let info1 = [status, type, gender, date]
    let info2 = [location]
    self.data.append(info1)
    self.data.append(info2)
    self.data.append(episodes)
  }

  private func configureContents() {
    tableView.tableHeaderView = header
    labelName.translatesAutoresizingMaskIntoConstraints = false
    labelFavourite.translatesAutoresizingMaskIntoConstraints = false
    buttonFavourite.translatesAutoresizingMaskIntoConstraints = false
    labelName.text = detailCharacter?.name
    header.backgroundColor = .systemGray5
    header.addSubview(labelName)
    header.addSubview(labelFavourite)
    header.addSubview(buttonFavourite)
    header.addSubview(image)
  }

  private func constraintsForHeader() {
    NSLayoutConstraint.activate([
      labelName.heightAnchor.constraint(equalToConstant: 30),
      labelName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
      labelName.trailingAnchor.constraint(equalTo: header.layoutMarginsGuide.trailingAnchor),
      labelName.topAnchor.constraint(equalTo: header.topAnchor, constant: 20),

      buttonFavourite.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
      buttonFavourite.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 13),

      labelFavourite.leadingAnchor.constraint(equalTo: buttonFavourite.trailingAnchor, constant: 5),
      labelFavourite.centerYAnchor.constraint(equalTo: buttonFavourite.centerYAnchor)
    ])
  }

  private func setImage() {
    if let strImage = detailCharacter?.image {
      image.image = networkService.setImage(strImage: strImage, image: image)
    }
  }
}
