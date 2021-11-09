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

func setCell(character: ResultCharacter) {
  name.text = character.name
  switch character.status {
  case "Alive":
    characterStatus.text = Status.alive.rawValue
    characterStatus.textColor = UIColor.green
  case "Dead":
    characterStatus.text = Status.dead.rawValue
    characterStatus.textColor = UIColor.red
  case "unknown":
    characterStatus.text = Status.unknown.rawValue
    characterStatus.textColor = UIColor.gray
  default:
    break
  }
  }
}
