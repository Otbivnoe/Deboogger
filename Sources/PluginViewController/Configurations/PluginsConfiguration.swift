//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation

final class PluginsConfiguration: NSObject, Configuration {

    let plugins: [Plugin]
    weak var tableView: UITableView?

    init(plugins: [Plugin]) {
        self.plugins = plugins
    }

    func configure() {
        plugins.forEach { plugin in
            self.tableView?.register(plugin.nib, forCellReuseIdentifier: plugin.cellIdentifier)
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plugins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plugin = plugins[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: plugin.cellIdentifier, for: indexPath)
        plugin.configure(cell)
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plugin = plugins[indexPath.row]
        plugin.selectionAction()
    }
}
