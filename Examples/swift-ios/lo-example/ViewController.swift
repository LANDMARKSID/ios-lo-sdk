import UIKit
import FLEX
import LandmarksIDSDK

class ViewController: UIViewController {
    
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var setCustomeDataButton: UIButton!
        
    @IBOutlet weak var sendLocationPermissionButton: UIButton!
    
    @IBOutlet weak var debuggerButton: UIButton!
    
    var keyCounter = 1
    
    @IBAction func didTapSettings(_ sender: UIButton, forEvent event: UIEvent) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func sendCustomDataButtonTap(_ sender: Any) {
        let ac = UIAlertController(title: "Enter Custom Data", message: nil, preferredStyle: .alert)
        ac.addTextField { [unowned self] textField in
            let formatter = ISO8601DateFormatter()
            let text = formatter.string(from: Date())
            textField.text = text
            textField.perform(#selector(selectAll), with: nil, afterDelay: 0.5)
            //textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
        }

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            if let customData = ac.textFields?.first?.text {
                LandmarksIDManagerDelegate.sharedManager().setCustomString("stringKEY", value: customData)
            }
        
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        
        ac.addAction(submitAction)
        ac.addAction(cancelAction)

        present(ac, animated: true)
    }
    
    
    @IBAction func sendLocationPermissionButtonTap(_ sender: Any) {
        LandmarksIDManagerDelegate.sharedManager().requestLocationPermissions(CLAuthorizationStatus.authorizedWhenInUse)
    }
    
    @IBAction func didTapDebuggerButton(_ sender: UIButton, forEvent event: UIEvent) {
        FLEXManager.shared.showExplorer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomeDataButton.imageView?.tintColor = .white
        sendLocationPermissionButton.imageView?.tintColor = .white
        
    }
}


