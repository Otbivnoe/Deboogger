//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class SliderTableViewCell: BaseTextTableViewCell {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    private var plugin: SliderPlugin?

    func configure(by plugin: SliderPlugin) {
        super.configure(by: plugin)
        self.plugin = plugin

        slider.minimumValue = plugin.minValue
        slider.maximumValue = plugin.maxValue
        slider.value = plugin.currentValue

        configureSliderTitle()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        plugin?.currentValue = sender.value
        configureSliderTitle()
        plugin?.sliderValueChanged(sender)
    }

    private func configureSliderTitle() {
        guard let plugin = self.plugin else {
            return
        }
        sliderLabel.text = "\(plugin.currentValue) / \(plugin.maxValue)"
    }
}
