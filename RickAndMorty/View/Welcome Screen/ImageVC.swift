import UIKit

class ImageVC: UIViewController {
  @IBOutlet var headerLabel: UILabel!
  @IBOutlet var descriptionText: UITextView!
  var index: Int?
  override func viewDidLoad() {
    super.viewDidLoad()
    if index != nil {
      headerLabel.text = headerText[index ?? 0]
      descriptionText.addHyperLinksToText(
        originalText: fullDescriptionText[index ?? 0],
        hyperLinks: hyperLinks[index ?? 0])
    }
    view.layer.cornerRadius = 10
  }
}
