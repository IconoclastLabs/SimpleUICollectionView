class PackageViewController < UICollectionViewController
  CELL_IDENTIFIER = "Package Cell"
  CELL_WIDTH = 160
  CELL_COUNT = 30 
  SECTION_COUNT = 3

  def viewDidLoad
    self.collectionView.registerClass(PackageCell, forCellWithReuseIdentifier:CELL_IDENTIFIER)
    # Package Header Needs to be registered, too
    self.collectionView.registerClass(PackageHeader, 
           forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, 
                  withReuseIdentifier: "PackageHeader")
    # THIS TRICKY PROPERTY MUST BE SET, OR DELEGATES AND ALL ARE IGNORED
    self.collectionView.collectionViewLayout.headerReferenceSize = CGSizeMake(10.0, 30.0)
    
    self.collectionView.collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)
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
    identifier =  "PackageHeader"
    clv.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:identifier, forIndexPath:path).tap do |header|
      header.display_string = "Section #{path.section}"
    end
  end

end
