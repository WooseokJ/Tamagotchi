

import UIKit

class SelectCollectionViewController: UICollectionViewController {
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var Tamals = TamaInfo().TamaAttribute
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //컬렉션뷰의 셀크기,셀사이 간격등 설명
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 0
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: (layoutwidth / 3), height: (layoutwidth / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        navigationItem.title = "다마고치 선택하기"
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.standardAppearance?.backgroundColor =  backgroundcolor
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tamals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as? SelectCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        let TamaData = Tamals[indexPath.row]
        cell.DesignTama(data: TamaData)
        cell.backgroundColor = backgroundcolor
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            
            
            
            
            present(DetailViewController, animated: true, completion: nil)
        }
    
    }
    
    
    
  
}
