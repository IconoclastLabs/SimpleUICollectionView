class PackageViewController < UICollectionViewController
  CELL_IDENTIFIER = "Package Cell"
  CELL_WIDTH = 160
  CELL_COUNT = 30 
  SECTION_COUNT = 3

  # we can set a default layout for the PackageViewController, can't we?
  def initWithCollectionViewLayout(layout = GridLayout.alloc.init)
    super
  end
  
  def viewDidLoad
    self.collectionView.registerClass(PackageCell, forCellWithReuseIdentifier:CELL_IDENTIFIER)
    # Package Header?
    self.collectionView.registerClass(PackageHeader, 
           forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, 
                  withReuseIdentifier: "PackageHeader")
    
    self.collectionView.dataSource = self
    self.collectionView.collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)

    # SETTING THE REFERENCE SIZE AND HAVING A DELEGATE ARE BOTH NEEDED TO MAKE THESE SHOW
    self.collectionView.collectionViewLayout.headerReferenceSize = CGSizeMake(10.0, 30.0)

    self.collectionView.backgroundColor = UIColor.blackColor
  end
    
  def collectionView(view, numberOfItemsInSection:section)
    CELL_COUNT
  end
    
  def collectionView(clv, cellForItemAtIndexPath:index_path)
    clv.dequeueReusableCellWithReuseIdentifier(CELL_IDENTIFIER, forIndexPath:index_path).tap do |cell|
      cell.display_string = "#{index_path.row}"  
    end
  end
  
  def numberOfSectionsInCollectionView(clv)
    SECTION_COUNT
  end
  
  def collectionView(clv, viewForSupplementaryElementOfKind:kind, atIndexPath:path)
    section = path.section
    
    identifier =  "PackageHeader"
    clv.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:identifier, forIndexPath:path)
  end
end
