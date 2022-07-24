

import UIKit

class SelectCollectionViewController: UICollectionViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //컬렉션뷰의 셀크기,셀사이 간격등 설명
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 0
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: (layoutwidth / 3), height: (layoutwidth / 3) * 1.1)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
        navigationItem.titleView?.tintColor = ColorName.fontcolor
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  ColorName.backgroundcolor
        
        if UserDefaults.standard.string(forKey: "tamaname") == nil{
            UserDefaults.standard.set("대장", forKey: "tamaname")
            UserDefaults.standard.set("시작하기", forKey: "startbutton")
            UserDefaults.standard.set("타마고치 시작하기", forKey: "tamachange")
            UserDefaults.standard.set(1.0, forKey: "level")
            UserDefaults.standard.set(0.0, forKey: "eatcnt")
            UserDefaults.standard.set(0.0, forKey: "drinkcnt")
            UserDefaults.standard.set(1, forKey: "backimagenum")
            
        }
        let navTitle = UserDefaults.standard.value(forKey: "tamachange") as! String
        navigationItem.title = navTitle
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TamaInfo().TamaAttribute.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as? SelectCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        let TamaData = TamaInfo().TamaAttribute[indexPath.row]
        cell.DesignTama(data: TamaData)
        cell.backgroundColor = ColorName.backgroundcolor
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let next = UIStoryboard(name: "Main", bundle: nil)
        let vc = next.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overCurrentContext // fullScreen+뒤에투명
        let TamaData = TamaInfo().TamaAttribute[indexPath.row]

        vc.takename = TamaData.name
        vc.takeImage = TamaData.imageName
        vc.takecontent = "저는 \(TamaData.name)입니당 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"
        
        vc.imageNum = indexPath.row + 1
        
        guard TamaInfo().TamaAttribute[indexPath.item].name != "준비중이에요" else{
            view.makeToast("준비중입니다.")
            return
        }
        present(nav, animated: true, completion: nil)
        
        
        
        
        
        
        }
    
}
    
    
    
  

