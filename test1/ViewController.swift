
import UIKit
import OrderedCollections

final class ViewControllerTest: UIViewController {
    
    let mainView = GeneralView()
    var cellDataArray = [CellData]()
    private let reuseIdentifierTableView = "cellTableView"
    
    
    override func loadView() {
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAddButton()
    }
    
    func setupTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: reuseIdentifierTableView)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Text field empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showErrorAlertDublicate() {
        let alertDublicate = UIAlertController(title: "Error", message: "Dublicate", preferredStyle: .alert)
        alertDublicate.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertDublicate, animated: true, completion: nil)
        
    }
    
    
    func setupAddButton() {
        mainView.addButton.addTarget(self, action: #selector(addPressed), for: UIControl.Event.touchUpInside)
    }
    
    
    @objc func addPressed() {
        guard let movie = mainView.titleTextField.text,
              let releaseYear = mainView.yearTextField.text else {return}

        if cellDataArray.contains(where: { $0.year == Int(releaseYear) && $0.title == movie }) {
                    showErrorAlertDublicate()
                    return
                }
        
        if mainView.titleTextField.text?.isEmpty ?? true || mainView.yearTextField.text?.isEmpty ?? true {
            showErrorAlert()
            return
        }
        
        var filmInfo = CellData()
        filmInfo.title = mainView.titleTextField.text!
        filmInfo.year = Int(mainView.yearTextField.text!) ?? 0
        cellDataArray.append(filmInfo)
        
        mainView.titleTextField.text = ""
        mainView.yearTextField.text = ""
        mainView.titleTextField.resignFirstResponder()
        mainView.yearTextField.resignFirstResponder()
        
        mainView.tableView.reloadData()
    }
}





//MARK: - Work with table view
extension ViewControllerTest: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTableView, for: indexPath) as! FilmTableViewCell
        cell.setupString(data: cellDataArray[indexPath.row])
        return cell
    }
}

