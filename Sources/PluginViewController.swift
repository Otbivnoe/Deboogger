//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class PluginViewController: UIViewController {

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.separatorInset = .zero
        tableView.allowsSelection = false
        return tableView
    }()
    
    private var plugins: [Plugin]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    init(plugins: [Plugin]) {
        self.plugins = plugins
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Deboogger"
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        plugins.forEach { plugin in
            self.tableView.register(plugin.nib, forCellReuseIdentifier: plugin.cellIdentifier)
        }

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closeButtonPressed))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: Actions
    
    @objc private func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate

extension PluginViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDataSource

extension PluginViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plugin = plugins[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: plugin.cellIdentifier, for: indexPath)
        plugin.configure(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plugins.count
    }
}
