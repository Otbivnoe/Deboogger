//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

class BaseTextTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .thin)
    }
    
    func configure(by plugin: TextPlugin) {
        titleLabel.attributedText = plugin.title
        descriptionLabel.attributedText = plugin.description

        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
}
