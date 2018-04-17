//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation

final class SectionsConfiguration: NSObject, Configuration {

    let sections: [Section]
    weak var tableView: UITableView?

    init(sections: [Section]) {
        self.sections = sections
    }

    func configure() {
        sections.flatMap { section in
            return section.plugins
        }.forEach { plugin in
            self.tableView?.register(plugin.nib, forCellReuseIdentifier: plugin.cellIdentifier)
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].plugins.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plugin = sections[indexPath.section].plugins[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: plugin.cellIdentifier, for: indexPath)
        plugin.configure(cell)
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plugin = sections[indexPath.section].plugins[indexPath.row]
        plugin.selectionAction()
    }
}
