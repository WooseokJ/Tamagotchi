import UIKit


class ColorName {
    static var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    static var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
}



extension UIView {
    func DetailCenterDesignView() {
        self.backgroundColor = .systemGray3
    }
    func DetailbackDesignView() {
        self.backgroundColor = ColorName.backgroundcolor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
    }

}

extension UILabel {
    func DetailNameDesign() {
        self.textAlignment = .center
        self.textColor = ColorName.fontcolor
    
    }
    func detailContentLabelDesign(_ textcontent : String) {
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = "저는 \(textcontent)입니당 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"
    }
    func MainContentLabelDesign(_ tamaname:String) {
        self.text = "\(tamaname)님 오늘 날씨가 좋네요."
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    func MainDesignLabel(text : String) {
        self.text = text
        self.layer.cornerRadius = 2
        self.backgroundColor = ColorName.backgroundcolor
        self.textAlignment = .center
    }

    
}

extension UIButton {
    func DetailCencelDesign(_ titlename:String) {
        self.setTitleColor(ColorName.fontcolor, for: .normal)
        self.setTitle(titlename, for: .normal)
        self.backgroundColor = .systemGray5
    }
    func DetailCorfirmDesign(_  titlename:String) {
        self.setTitleColor(ColorName.fontcolor, for: .normal)
        self.setTitle(titlename, for: .normal)
        
    }
    func MainDesingButton(tintcolor: UIColor, title: String, imagename: String) {
        self.tintColor = tintcolor
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(systemName: imagename), for: .normal)
    }
    
}


extension UITextField {
    func DesignTextField(title: String) {
        self.placeholder = title
        self.backgroundColor = ColorName.backgroundcolor
        self.borderStyle = .none
        self.textAlignment = .center
        self.keyboardType = .numberPad
    }
    func renameTextFieldDesign(title: String){
        self.placeholder = title
        self.backgroundColor = ColorName.backgroundcolor
        self.borderStyle = .none
    }
    
}

extension UINavigationItem {
    func navItemDesign() {
        self.titleView?.tintColor = ColorName.fontcolor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        self.scrollEdgeAppearance = navigationBarAppearance
        self.standardAppearance = navigationBarAppearance
        self.scrollEdgeAppearance?.backgroundColor =  ColorName.backgroundcolor
    }
    
}




//static 변수는 초기화할떄 초기화가안됨.
