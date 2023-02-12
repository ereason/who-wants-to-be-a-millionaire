import UIKit

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
