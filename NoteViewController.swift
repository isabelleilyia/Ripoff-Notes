import UIKit

class NoteViewController: UIViewController {
    @IBOutlet var contentTextView: UITextView!
    
    var note: Note? = nil

    @IBAction func delete () {
        NoteManager.shared.deleteNote(note: note!)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentTextView.text = note!.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        note!.content = contentTextView.text
        NoteManager.shared.saveNote(note: note!)
    }
}
