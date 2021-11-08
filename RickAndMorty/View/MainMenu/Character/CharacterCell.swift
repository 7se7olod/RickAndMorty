import UIKit

class CharacterCell: UITableViewCell {
  @IBOutlet var characterImage: UIImageView!
  @IBOutlet var name: UILabel!
  @IBOutlet var characterStatus: UILabel!
  @IBOutlet var characterFavourite: UIButton!

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    characterImage.layer.cornerRadius = characterImage.frame.size.width / 2
  }
}
