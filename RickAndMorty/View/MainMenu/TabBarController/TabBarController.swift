import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  private lazy var middleButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    tabBar.unselectedItemTintColor = .white
    self.delegate = self
    setupMiddleButton()
    tappedColor()
  }

  private func tappedColor() {
    if selectedIndex == 2 {
      middleButton.setImage(UIImage(named: "favouriteTapped"), for: .normal)
    } else {
      middleButton.setImage(UIImage(named: "heart"), for: .normal)
    }
  }

  private func setupMiddleButton() {
    middleButton = UIButton(
      frame: CGRect(
        x: (self.view.bounds.width / 2) - 30,
        y: -37,
        width: 60,
        height: 60))
    middleButton.setBackgroundImage(UIImage(named: "circleFill"), for: .normal)
    //    middleButton.setImage(UIImage(named: "heart"), for: .normal)
    self.tabBar.addSubview(middleButton)
    middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
    middleButton.addTarget(self, action: #selector(changeColor), for: .touchDown)
    self.view.layoutIfNeeded()
  }

  @objc private func menuButtonAction(sender: UIButton) {
    self.selectedIndex = 2
    tappedColor()
  }
  @objc private func changeColor(sender: UIButton) {
    tappedColor()
  }
}
