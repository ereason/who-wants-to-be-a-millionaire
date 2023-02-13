import UIKit

class GuestViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onBackgroundTapped(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.endEditing()
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        let controller = QuizViewController(nibName: "QuizViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        let username = inputName.text ?? "Guest"
        UserManager.shared.username = username
        controller.quizBrain = MillionareBrain(userName: username)
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated:false)
    }
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
