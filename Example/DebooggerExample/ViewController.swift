//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit
import Deboogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red

        NotificationCenter.default.addObserver(forName: DebooggerWillShow, object: nil, queue: nil) { _ in
            print("DebooggerWillShow")
        }

        NotificationCenter.default.addObserver(forName: DebooggerDidShow, object: nil, queue: nil) { _ in
            print("DebooggerDidShow")
        }

        NotificationCenter.default.addObserver(forName: DebooggerWillHide, object: nil, queue: nil) { _ in
            print("DebooggerWillHide")
        }

        NotificationCenter.default.addObserver(forName: DebooggerEndHide, object: nil, queue: nil) { _ in
            print("DebooggerEndHide")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}

