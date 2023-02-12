import UIKit

class RegisterScreenViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        if let username = usernameTextField.text, !username.isEmpty {
            Constant.username = username
            dismiss(animated: true)
        }
    }
}
