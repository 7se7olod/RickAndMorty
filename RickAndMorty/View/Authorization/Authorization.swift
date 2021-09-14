import UIKit

class Authorization: UIViewController {
  private let fakeEnter = "Test"
  var rightButton = UIButton(type: .custom)
  let showPasswordButton = UIButton(type: .custom)
  let showPasswordImage = UIImage(named: "📍Trailing Icon")

  @IBOutlet var loginTF: UITextField!
  @IBOutlet var passwordTF: UITextField!
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var errorLabel: UILabel!
  @IBOutlet var stackViewPassword: UIStackView!
  @IBOutlet var stackViewLogin: UIStackView!


  override func viewDidLoad() {
    super.viewDidLoad()
    errorLabel.isHidden = true
    loginTF.delegate = self
    passwordTF.delegate = self
    showPasswordButtonSetting()
    passwordFieldButton()
    let bottomLinePassword = CALayer()
    let stackViewPswrdHeight = stackViewPassword.frame.height
    let stackViewPswrdWidth = stackViewPassword.frame.width
    bottomLinePassword.frame = CGRect(x: 0.0, y: stackViewPswrdHeight, width: stackViewPswrdWidth, height: 1.0)
    bottomLinePassword.backgroundColor = UIColor.gray.cgColor
    stackViewPassword.layer.addSublayer(bottomLinePassword)
    let bottomLineLogin = CALayer()
    let stackViewLoginHeight = stackViewLogin.frame.height
    let stackViewLoginWidth = stackViewLogin.frame.width
    bottomLineLogin.frame = CGRect(x: 0.0, y: stackViewLoginHeight, width: stackViewLoginWidth, height: 1.0)
    bottomLineLogin.backgroundColor = UIColor.gray.cgColor
    stackViewLogin.layer.addSublayer(bottomLineLogin)
  }
  @IBAction func loginAction(_ sender: UIButton) {
    guard loginTF.text == fakeEnter && passwordTF.text == fakeEnter else {
      errorLabel.isHidden = false
      errorLabel.textColor = .red
      loginTF.tintColor = .red
      loginTF.textColor = .red
      passwordTF.textColor = .red
      return
    }
    performSegue(withIdentifier: "LoginToTableView", sender: self)
    }

  func showPasswordButtonSetting() {
    showPasswordButton.setImage(showPasswordImage, for: .normal)
    showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
    showPasswordButton.sizeToFit()
    showPasswordButton.tintColor = .darkGray
  }
  @objc func showPassword() {
    passwordTF.isSecureTextEntry.toggle()
  }
  func passwordFieldButton() {
    passwordTF.rightView = showPasswordButton
    passwordTF.rightViewMode = .always
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    loginTF.resignFirstResponder()
    passwordTF.resignFirstResponder()
    return true
  }
}
extension Authorization: UITextFieldDelegate {
}
