import UIKit


class NameClass{
    static var growImageNumber = 1
}

class ColorName{
    static var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    static var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
}


extension UIView{
    func DetailCenterDesignView(){
        self.backgroundColor = .systemGray3
    }
    func DetailbackDesignView(){
        self.backgroundColor = ColorName.backgroundcolor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
    }

}

extension UILabel{
    func DetailNameDesign(){
        self.textAlignment = .center
        self.textColor = ColorName.fontcolor
    
    }
    func detailContentLabelDesign(_ textcontent : String){
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = textcontent
    }
    func MainContentLabelDesign(_ tamaname:String){
        self.text = "\(tamaname)님 오늘 날씨가 좋네요."
        self.textAlignment = .center
    }

    
}

extension UIButton{
    func DetailCencelDesign(_ titlename:String){
        self.setTitleColor(ColorName.fontcolor, for: .normal)
        self.setTitle(titlename, for: .normal)
        self.backgroundColor = .systemGray5
    }
    func DetailCorfirmDesign(_  titlename:String){
        self.setTitleColor(ColorName.fontcolor, for: .normal)
        self.setTitle(titlename, for: .normal)
        
    }
}


//static 변수는 초기화할떄 초기화가안됨.
