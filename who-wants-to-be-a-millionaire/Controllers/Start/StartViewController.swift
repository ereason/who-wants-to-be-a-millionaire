import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rulesButtomTapped(_ sender: UIButton) {
        let controller = RulesViewController(nibName: "RulesViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let controller = QuestionsViewController(nibName: "QuestionsViewController", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
