import UIKit

class LoseScreenViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
