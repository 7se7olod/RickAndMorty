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
    showTabBarController()
  }
  @IBAction func menuBurger(_ sender: Any) {
    showBurgerMenu()
  }
  @IBAction func characterButton(_ sender: Any) {
    showCharactern()
  }
  func showTabBarController() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let tabBar = storyboard.instantiateViewController(identifier: "TabBarController") as? TabBarController else { return }
    burgerView.insertSubview(tabBar.view, at: 0)
    showBurgerMenu()
    navigationItem.title = "Menu"
  }
  func showCharactern() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let mainVC = storyboard.instantiateViewController(
            identifier: "MenuViewController") as? MenuViewController else { return }
    burgerView.insertSubview(mainVC.view, at: 1)
    showBurgerMenu()
    navigationItem.title = "Character"
  }
  func showBurgerMenu() {
    if !hamburgerMenuVisible {
      leadingBurgerViewConstraint.constant = stackView.frame.width

      hamburgerMenuVisible = true
    } else {
      leadingBurgerViewConstraint.constant = 0
      hamburgerMenuVisible = false
    }
    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
      self.view.layoutIfNeeded()
    })
  }
}
