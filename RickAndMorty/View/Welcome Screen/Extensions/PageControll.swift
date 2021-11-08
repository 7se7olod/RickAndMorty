import Foundation
import UIKit
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
    if currentIndex == headerText.count { return nil }
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
      case 3: updatePageControlUI(2)
      case 4: updatePageControlUI(3)
      case 5: updatePageControlUI(4)
      case nil: updatePageControlUI(5)
      default: updatePageControlUI(0)
    }
  }
}
