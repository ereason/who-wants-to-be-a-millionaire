import UIKit

class LoseViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playAgainTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
