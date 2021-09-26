//
//  CatFactRouter.swift
//  RoP_TestingSample
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation
import UIKit

protocol CatFactViewRouter {
}

class CatFactViewRouterImplementation: CatFactViewRouter {
    fileprivate weak var viewController: CatFactViewController?
    
    init(viewController: CatFactViewController) {
        self.viewController = viewController
    }
    
}
