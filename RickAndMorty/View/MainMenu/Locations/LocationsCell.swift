import UIKit

class LocationsCell: UITableViewCell {
  @IBOutlet var favouriteLabelLocation: UIButton!
  @IBOutlet var locationLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
