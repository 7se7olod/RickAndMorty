import UIKit

class WelcomeViewController: UIViewController {
  @IBOutlet var pageControl: UIPageControl!
  @IBOutlet var contentView: UIView!
  var presentImg = ["img1", "img2", "img3"]
  let dot1 = UIImage(named: "page dot 1")
  let dot2 = UIImage(named: "page dot 2")
  var currentViewControllerIndex = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    pageControl.numberOfPages = presentImg.count
    pageControl.backgroundColor = .white
    pageControl.preferredIndicatorImage = UIImage(named: "page dot 2")
    pageControl.setIndicatorImage(UIImage(named: "page dot 1"), forPage: 0)
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
    if index >= presentImg.count || presentImg.isEmpty || index < 0 { return nil }
    guard let imageVC = storyboard?.instantiateViewController(
    identifier: String(describing: ImageVC.self)) as? ImageVC else { return nil }
    imageVC.displayImage = UIImage(named: presentImg[index])
    imageVC.index = index
    return imageVC
  }
  func updatePageControlUI(_ currentPageIndex: Int) {
    (0..<pageControl.numberOfPages).forEach { (index) in
      let pageIcon = index == currentPageIndex ? dot1 : dot2
      pageControl.setIndicatorImage(pageIcon, forPage: index)
    }
  }
}

extension WelcomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
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
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    guard let pageCurrent = pageViewController.viewControllers?.first else { return }
    let nextImageVC = pageViewController.dataSource?.pageViewController(
      pageViewController, viewControllerAfter: pageCurrent) as? ImageVC
    switch nextImageVC?.index {
    case 1: updatePageControlUI(0)
    case 2: updatePageControlUI(1)
    case nil: updatePageControlUI(2)
    default: updatePageControlUI(0)
    }
  }
}
