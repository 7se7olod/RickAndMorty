import UIKit

class Statistics: UIViewController {
  var timer = Timer()
  var seconds = 0
  @IBOutlet var secondsLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    timer = Timer.scheduledTimer(
      timeInterval: 1,
      target: self,
      selector: #selector(timerAction),
      userInfo: nil,
      repeats: true)
  }
  @IBAction func resetTimer(_ sender: UIButton) {
    let alert = UIAlertController(title: "Reset time", message: "Do you want to reset time?", preferredStyle: .alert)
    let yesAction = UIAlertAction(title: "YES", style: .default) { _ in
      self.seconds = 0
      self.secondsLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
    }
    let noAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
    alert.addAction(yesAction)
    alert.addAction(noAction)
    self.present(alert, animated: true, completion: nil)
  }
  @objc func timerAction() {
    seconds += 1
    let time = secondsToHoursMinutesSeconds(seconds: seconds)
    let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
    secondsLabel.text = timeString
  }

  func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
    return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
  }
  func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
    var timeString = ""
    timeString += String(format: "%02d", hours)
    timeString += String(format: "%02d", minutes)
    timeString += String(format: "%02d", seconds)
    return timeString
  }
}
