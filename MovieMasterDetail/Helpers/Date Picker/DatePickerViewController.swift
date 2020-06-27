
import UIKit
protocol DatePickerDelegate {
    func didPickedUpYear(year: String)
}
class DatePickerViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    
    // MARK: - Outelts
    @IBOutlet weak var picker: UIPickerView!
    
    // MARK: - Varibles
    var years = [String]()
    var delegate: DatePickerDelegate?
    var selectedYear :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    @IBAction func SaveTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true) {
            if let delegate = self.delegate{
                delegate.didPickedUpYear(year: self.selectedYear!)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return years.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return years[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedYear = years[row]
    }
    
}
extension DatePickerViewController{
    func config(delegate: DatePickerDelegate,years:[String]){
        self.delegate = delegate
        self.years = years
        self.selectedYear = years.first
    }
}
