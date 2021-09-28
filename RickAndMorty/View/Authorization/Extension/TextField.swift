import UIKit

extension Authorization: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    passwordTF.resignFirstResponder()
    if textField == loginTF {
      loginTF.resignFirstResponder()
      passwordTF.becomeFirstResponder()
    }
    return true
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
