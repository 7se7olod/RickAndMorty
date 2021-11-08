import UIKit

class MainBurgerViewController: UIViewController {
  var hamburgerMenuVisible = false
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var burgerView: UIView!
  @IBOutlet var stackView: UIStackView!
  @IBOutlet var leadingBurgerViewConstraint: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.size.width / 2
    burgerView.alpha = 1
    showBurgerMenu()
  }
  @IBAction func menuBurger(_ sender: Any) {
    showBurgerMenu()
  }
  @IBAction func characterButton(_ sender: Any) {
    // showCharactern()
  }
  @IBAction func locationButton(_ sender: UIButton) {
    // showLocation()
  }
//  func showCharactern() {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    guard let tabBar = storyboard.instantiateViewController(identifier: "CharacterVC") as?
//    CharacterViewController else { return }
//    burgerView.addSubview(tabBar.view)
//    showBurgerMenu()
//    tabBar.view.backgroundColor = .orange
//    navigationItem.title = "Character"
//  }
//  func showLocation() {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    guard let tabBar = storyboard.instantiateViewController(identifier: "Location") as?
//    LocationViewController else { return }
//    burgerView.addSubview(tabBar.view)
//    showBurgerMenu()
//    tabBar.view.backgroundColor = .blue
//    navigationItem.title = "Location"
//  }
  func showBurgerMenu() {
    if !hamburgerMenuVisible {
      leadingBurgerViewConstraint.constant = stackView.frame.width
      hamburgerMenuVisible = true
    } else {
      leadingBurgerViewConstraint.constant = 0
      hamburgerMenuVisible = false
    }
    UIView.animate(
      withDuration: 0.2,
      delay: 0.0,
      options: .curveEaseIn,
      animations: ({ self.view.layoutIfNeeded() })
    )
  }
}
