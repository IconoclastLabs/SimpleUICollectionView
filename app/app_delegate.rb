class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds).tap do |win|
      @view_controller = PackageViewController.alloc.initWithCollectionViewLayout(UICollectionViewFlowLayout.alloc.init)
      win.rootViewController = @view_controller
      win.makeKeyAndVisible
    end
    true
  end
end