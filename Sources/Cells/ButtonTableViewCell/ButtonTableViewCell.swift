//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class ButtonTableViewCell: BaseTextTableViewCell {

    private var plugin: ButtonPlugin?
    
    @IBOutlet weak var activateButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        activateButton.backgroundColor = UIColor.lightGray
    }
    
    func configure(by plugin: ButtonPlugin) {
        super.configure(by: plugin)
        self.plugin = plugin
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        activateButton.layer.cornerRadius = activateButton.bounds.height / 2
    }
    
    @IBAction func touchDownEvent(_ sender: UIButton) {
        activateButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
    }
    
    @IBAction func touchUpInsideEvent(_ sender: UIButton) {
        plugin?.buttonPressed(sender)
        activateButton.backgroundColor = UIColor.lightGray
    }
}
