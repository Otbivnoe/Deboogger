//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

protocol Configuration: UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView? { get set }
    func configure() 
}
