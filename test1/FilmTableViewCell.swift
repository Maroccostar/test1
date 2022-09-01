 
import UIKit

class FilmTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupString(data: CellData) {
        titleLabel.text = data.title + " " + data.year.description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.horizontally(16).vertically()
    }
}
