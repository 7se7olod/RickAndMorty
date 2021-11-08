import UIKit

class TabBar: UITabBar {
  private var shapeLayer: CALayer?

  private func addShape() {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = createPath()
    shapeLayer.strokeColor = UIColor(red: 0, green: 0.696443975, blue: 0.84051615, alpha: 1).cgColor
    shapeLayer.fillColor = UIColor(red: 0, green: 0.696443975, blue: 0.84051615, alpha: 1).cgColor
    shapeLayer.lineWidth = 1.0

    if let oldShapeLayer = self.shapeLayer {
      self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
    } else {
      self.layer.insertSublayer(shapeLayer, at: 0)
    }
    self.shapeLayer = shapeLayer
  }

  override func draw(_ rect: CGRect) {
    self.addShape()
  }

  // MARK: - Рисунок впадины tabBar
  func createPath() -> CGPath {
    let height: CGFloat = 15
    let path = UIBezierPath()
    let centerWidth = self.frame.width / 2

    path.move(to: CGPoint(x: 0, y: 0)) // начальная позиция
    path.addLine(to: CGPoint(x: centerWidth - 36, y: 0)) // левый угол впадины
    path.addQuadCurve(
      to: CGPoint(x: centerWidth, y: 29),
      controlPoint: CGPoint(x: centerWidth - 29, y: height + 13)) // нижняя левая кривая
    path.addQuadCurve(
      to: CGPoint(x: centerWidth + 36, y: height - 15),
      controlPoint: CGPoint(x: centerWidth + 29, y: height + 13)) // нижняя правая кривая
    path.addLine(to: CGPoint(x: self.frame.width, y: 0)) // правый угол впадины
    // close the path
    path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
    path.addLine(to: CGPoint(x: 0, y: self.frame.height))
    path.close()
    return path.cgPath
  }


  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let pointIsInside = super.point(inside: point, with: event)
    if pointIsInside == false {
      for subview in subviews {
        let pointInSubview = subview.convert(point, from: self)
        if subview.point(inside: pointInSubview, with: event) {
          return true
        }
      }
    }
    return pointIsInside
  }
}
