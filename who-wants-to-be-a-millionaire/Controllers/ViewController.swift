import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    var questions = Question.questions()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.answerButton()
        
        questions.forEach {
            print($0.level, $0.ask)
        }
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let viewcontroller = LoseViewController(nibName: "LoseViewController", bundle: nil)
        viewcontroller.modalPresentationStyle = .fullScreen
        viewcontroller.view.backgroundColor = .red
        self.present(viewcontroller, animated: true)
    }
}

