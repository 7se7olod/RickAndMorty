import UIKit

class ImageVC: UIViewController {
  @IBOutlet var headerLabel: UILabel!
  @IBOutlet var descriptionText: UITextView!
  var ddd: UITextView?
  var displayHeaderLabel: String?
  var displayDescrLabel: String?
  var index: Int?
  override func viewDidLoad() {
    super.viewDidLoad()
    headerLabel.text = displayHeaderLabel
    descriptionText.text = displayDescrLabel
    view.layer.cornerRadius = 10
  }
}
