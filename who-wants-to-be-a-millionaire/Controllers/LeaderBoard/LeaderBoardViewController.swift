import UIKit

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
        tableView.register(LeaderBoardTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }

    @IBAction func backTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension LeaderBoardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LeaderBoardTableViewCell else { return UITableViewCell() }
        let score = UserManager.shared.highscores[indexPath.row]
        cell.configure(with: score)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserManager.shared.highscores.count
    }
}
