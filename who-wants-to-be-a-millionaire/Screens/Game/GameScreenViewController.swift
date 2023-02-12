import UIKit

class GameScreenViewController: UIViewController {

    @IBOutlet var buttons: [AnswersButton]!
    var answer: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        buttons[0].setTitle("Ответ")
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        if answer {
            let controller = WinScreenViewController(nibName: "WinScreenViewController", bundle: nil)
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
            answer = true
            let controller = LoseScreenViewController(nibName: "LoseScreenViewController", bundle: nil)
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}
