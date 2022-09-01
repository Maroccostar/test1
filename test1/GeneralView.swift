
import UIKit
import PinLayout

final class GeneralView: UIView {
    
    let titleTextField = UITextField()
    let yearTextField = UITextField()
    let addButton = UIButton()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .white
        
        addSubview(titleTextField)
        titleTextField.placeholder = "Title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.keyboardType = .alphabet
        
        addSubview(yearTextField)
        yearTextField.placeholder = "Year"
        yearTextField.borderStyle = .roundedRect
        yearTextField.keyboardType = .numberPad
        
        addSubview(addButton)
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = .blue
        addButton.setTitle("Add", for: .normal)
        
        addSubview(tableView)
        tableView.tableFooterView = UIView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleTextField.pin.top(75).horizontally(16).height(46)
        yearTextField.pin.below(of: titleTextField).marginTop(15).horizontally(16).height(46)
        addButton.pin.below(of: yearTextField).marginTop(15).center().height(45).width(60)
        tableView.pin.below(of: addButton).marginTop(10).horizontally().bottom(pin.safeArea.bottom)
    }
}
