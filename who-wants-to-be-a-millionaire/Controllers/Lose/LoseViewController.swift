import UIKit

class LoseViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var quizBrain: MillionareBrain!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = String(quizBrain.getPrice())
        titleLable.text = quizBrain.getUsername()
        print(quizBrain.getUsername())
    }

    @IBAction func playAgainTapped(_ sender: UIButton) {
    
        self.navigationController?.popToRootViewController(animated: false)
       // present(controller, animated: true)
    }
}
