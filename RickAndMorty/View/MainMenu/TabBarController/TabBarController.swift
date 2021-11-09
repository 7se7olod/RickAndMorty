import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  // иконки для кнопки
  private let unselectedFavouriteButton = UIImage(named: "heart")
  private let selectedFavouriteButton = UIImage(named: "favouriteTapped")
  private let circleFavouriteButton = UIImage(named: "circleFill")

  private let diametrButton: CGFloat = 60 // диаметр копки
  private lazy var middleButton: UIButton = {
    let middleButton = UIButton()
    middleButton.layer.cornerRadius = diametrButton / 2
    middleButton.setBackgroundImage(circleFavouriteButton, for: .normal)
    middleButton.setImage(unselectedFavouriteButton, for: .normal)
    middleButton.translatesAutoresizingMaskIntoConstraints = false
    middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
    self.view.layoutIfNeeded()
    return middleButton
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    tabBar.unselectedItemTintColor = .white
    self.delegate = self
    makeUI()
  }

  // Настройка констрейнтов кнопки
  private func makeUI() {
    tabBar.addSubview(middleButton)
    NSLayoutConstraint.activate([
      middleButton.heightAnchor.constraint(equalToConstant: diametrButton),
      middleButton.widthAnchor.constraint(equalToConstant: diametrButton),
      middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
      middleButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: -7)
    ])
  }

  // смена цвета кнопки при переключении
  private func tappedColor() {
    if self.selectedIndex != 2 {
      middleButton.setImage(unselectedFavouriteButton, for: .normal)
    } else {
      middleButton.setImage(selectedFavouriteButton, for: .normal)
    }
  }
  @objc private func menuButtonAction(sender: UIButton) {
    self.selectedIndex = 2
    tappedColor()
  }
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    tappedColor()
  }
}
