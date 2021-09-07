import UIKit

class PageVC: UIPageViewController {
  var pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageVC.self])
  override func viewDidLoad() {
    super.viewDidLoad()
    view.contentMode = .scaleAspectFit
    pageControl.currentPageIndicatorTintColor = .init(red: 0, green: 142, blue: 214, alpha: 1)
    // Изменить pageIndicator! на точку с пустым центром!
    pageControl.pageIndicatorTintColor = .init(red: 0, green: 142, blue: 214, alpha: 0.2)
  }
}
