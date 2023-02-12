import UIKit

class WelcomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startTapped(_ sender: UIButton) {
        if Constant.username.isEmpty {
            let controller = RegisterScreenViewController(nibName: "RegisterScreenViewController", bundle: nil)
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true) { [weak self] in
                self?.startGame()
            }
        } else {
            startGame()
        }
    }
    
    func startGame() {
        let controller = GameScreenViewController(nibName: "GameScreenViewController", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
