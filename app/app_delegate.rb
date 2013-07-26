class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    search_controller = SearchController.alloc.initWithNibName(nil, bundle: nil)
    navigation_controller = UINavigationController.alloc.initWithRootViewController(search_controller)
    create_main_window(navigation_controller)
    true
  end

  def create_main_window(navigation_controller)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigation_controller
    @window.makeKeyAndVisible
  end
end
