//
//  CatFactController.swift
//  RoP_TestingSample
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation
import UIKit

class CatFactViewController: UIViewController {
    var presenter: CatFactPresenter!
    var configurator: CatFactConfigurator!
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var getFactButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = CatFactConfiguratorImplementation()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }

    @IBAction func getFactTapped(_ sender: Any) {
        presenter.getNewFact()
    }

}

extension CatFactViewController: CatFactView {
    func setNewFact(text: String) {
        factLabel.text = text
    }
}
