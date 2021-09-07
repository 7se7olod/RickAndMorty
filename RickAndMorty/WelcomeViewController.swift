import UIKit

class WelcomeViewController: UIViewController {
  @IBOutlet var contentView: UIView!
  var presentImg = ["img1", "img2", "img3"]
  var currentViewControllerIndex = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    startPresentation()
  }
  func startPresentation() {
    if let pageVC = storyboard?.instantiateViewController(identifier: String(describing: PageVC.self)) as? PageVC {
      present(pageVC, animated: true)
      pageVC.delegate = self
      pageVC.dataSource = self
      addChild(pageVC)
      pageVC.didMove(toParent: self)
      pageVC.view.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(pageVC.view)
      let views: [String: Any] = ["pageView": pageVC.view as Any]
      contentView.addConstraints(
        NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-0-[pageView]-0-|",
          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
          metrics: nil,
          views: views))
      contentView.addConstraints(
        NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-0-[pageView]-0-|",
          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
          metrics: nil,
          views: views))
      guard let startingVC = showViewControllerAtIndex(currentViewControllerIndex) else { return }
      pageVC.setViewControllers([startingVC], direction: .forward, animated: true)
    }
  }

  func showViewControllerAtIndex(_ index: Int) -> ImageVC? {
    if index >= presentImg.count || presentImg.isEmpty { return nil }
    guard let imageVC = storyboard?.instantiateViewController(
    identifier: String(describing: ImageVC.self)) as? ImageVC else { return nil }
    imageVC.displayImage = UIImage(named: presentImg[index])
    imageVC.index = index
    return imageVC
  }
}

extension WelcomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return currentViewControllerIndex
  }
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return presentImg.count
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let imageVC = viewController as? ImageVC
    guard var currentIndex = imageVC?.index else { return nil }
    currentViewControllerIndex = currentIndex
    if currentIndex == 0 { return nil }
    currentIndex -= 1
    return showViewControllerAtIndex(currentIndex)
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let imageVC = viewController as? ImageVC
    guard var currentIndex = imageVC?.index else { return nil }
    if currentIndex == presentImg.count { return nil }
    currentIndex += 1
    currentViewControllerIndex = currentIndex
    return showViewControllerAtIndex(currentIndex)
  }
}
