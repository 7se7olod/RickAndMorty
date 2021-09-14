import UIKit

class ImageVC: UIViewController {
  @IBOutlet var showImage: UIImageView!
  var displayImage: UIImage?
  var index: Int?
  override func viewDidLoad() {
    super.viewDidLoad()
    showImage.contentMode = .scaleAspectFit
    showImage.image = displayImage
  }
}
