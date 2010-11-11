iOS Sample Code
=============

This are the [Apple iOS samples][apple], sometimes with some slightly modifications,
as a starting point for a personal training developing iOS applications.

Samples
-------
1. _CoreDataBooks_ illustrates a number of aspects of working with the Core Data framework with an iPhone application:
   * Use of an instance of NSFetchedResultsController object to manage a collection of objects to be displayed in a table view.
   * Use of a second managed object context to isolate changes during an add operation.
   * Undo and redo. 
   * Database initialization.

2. _CryptoExercise_ demonstrates the use of the two main Cryptographic API sets on the iPhone OS SDK. 
   Asymmetric Key Encryption and random nonce generation is handled through the Security framework API set, 
   whereas, Symmetric Key Encryption is handled by the CommonCrypto API set. The CryptoExercise sample brings 
   both of these APIs together through a network service, discoverable via Bonjour, that performs a "dummy" 
   cryptographic protocol between devices found on the same subnet.
   For more information read the ReadMe.txt in the CryptoExercise branch.

3. _Icons_ demonstrates the proper use of application icons on iOS.

4. _KeyboardAccessory_ shows how to use a keyboard accessory view.
   The application uses a single view controller. The view controller's view is covered by a text view. 
   When you tap the text view, the view controller loads a nib file containing an accessory view that 
   it adds to the text view. The accessory view contains a button. When you tap the button, the text 
   "You tapped me." is added to the text view. The sample also shows how you can use the keyboard-will-show 
   and keyboard-will-hide notifications to animate resizing a view that is obscured by the keyboard.

5. _MultipleDetailViews_ shows how you can use UISplitViewController to manage multiple detail views.

6. _QuartzDemo_ is an iPhone OS application that demonstrates many of the Quartz2D APIs made available 
   by the CoreGraphics framework. Quartz2D forms the foundation of all drawing on iPhone OS and provides 
   facilities for drawing lines, polygons, curves, images, gradients, PDF and many other graphical facilities.

7. _TheElements_ provides access to the data contained in the Periodic Table of the Elements.  TheElements 
   provides this data in multiple formats, allowing you to sort the data by name, atomic number, symbol name, 
   and an elements physical state at room temperature.  The application illustrates the following techniques:
   * Configuring and responding to selections in a tab bar
   * Displaying information in a tableview using both plain and grouped style table views
   * Using navigation controllers to navigate deeper into a data structure
   * Subclassing UIView
   * Providing a custom UITableViewCell consisting of multiple subviews
   * Implementing the UITableViewDelegate protocol
   * Implementing the UITableViewDataSource protocol
   * Reacting to taps in views
   * Open a URL to an external web site using Safari
   * Flipping view content from front to back
   * Creating a reflection of a view in the interface

8. _XMLPerformance_ explores two approaches to parsing XML, focusing on performance with respect to 
   speed, memory footprint, and user experience. The XML data used is the current "Top 300" songs 
   from the iTunes store. The data itself is not particularly important to the sample - it was 
   chosen because of its simplicity, availability, and because the size (approximately 850KB) is 
   sufficient to demonstrate the performance issues central to the sample.

9. _iPhoneCoreDataRecipes_ shows how you can use view controllers, table views, and Core Data in an iPhone application.
   The application uses the domain of organizing and presenting recipes to show how you can use the view controller 
   as the organizing unit to manage screenfuls of information, and how you can leverage table views to display and edit data in an elegant fashion.
   Amongst the techniques shown are how to:
   * Combine tab bar and navigation controllers to create a complex navigation flow
   * Customize a navigation bar
   * Implement custom table view cells that reformat themselves in response to editing, removing unnecessary 
     information to ensure that the display remains uncluttered
   * Customize a table header view
   * Present modal views
   * Use multiple entities in a Core Data application
   * Provide a default Core Data persistent store

10. _LaunchMe_ demonstrates how to register a new URL type. Registering a new URL type allows other applications to interact with yours.

11. _ViewTransitions_ demonstrates how to perform transitions between two views using built-in Core Animation transitions.

12. _AccelerometerGraph_ graphs the motion of the device. It demonstrates how to use the UIAccelerometer class and how to use Quartz2D 
    and Core Animation to provide a high performance graph view. It also demonstrates a low-pass filter that you can use to isolate 
    the effects of gravity, and a high-pass filter that you can use to remove the effects of gravity.

13. _Accessory_ demonstrates how to implement a custom accessory view for your UITableView in the form of a checkmark button.

14. _AppPrefs_ demonstrates how to display your app's preferences or settings in the "Settings" system application.

15. _AdvencedTableViewCells_ demonstrates several different ways to handle complex UITableViewCells.

16. _AlternateViews_ demonstrates how to implement alternate or distinguishing view controllers for each particular device orientation.

17. _AdvancedURLConnections_ demonstrates various advanced networking techniques with NSURLConnection.  
    Specifically, it demonstrates how to respond to authentication challenges, how to modify the default server trust evaluation 
    (for example, to support a server with a self-signed certificate), and how to provide client identities.

18. _BatteryStatus_ demonstrates the use of the battery status properties and notifications provided via the iPhone OS SDK.

19. _Breadcrumb_ Demonstrates how to draw a path using the Map Kit overlay, MKOverlayView, that follows and tracks the user's current location.  
    The included CrumbPath and CrumbPathView overlay and overlay view classes can be used for any path of points that are expected to change over time.

20. _BubbleLevel_ demonstrates how to receive and interpret acceleration information, animate a view, and display a utility view (used for calibration).

21. _CopyPasteTile_ demonstrates how to implement the copy-cut-paste feature introduced in iPhone OS v3.0.

22. _CurrentAddress_ basic use of MapKit, displaying a map view and setting its region to current location.

23. _DateCell_ demonstrates formatted display of date objects in table cells and use of UIDatePicker to edit those values.

24. _DateSectionTitles_ shows how to create section information for NSFetchedResultsController using dates.

25. _DocInteraction_ demonstrates how to use UIDocumentInteractionController to obtain information about documents and how to preview them. 

26. _DrillDownSave_ demonstrates how to restore the user's current location in a drill-down list style user interface and restore that location 
    when the app is relaunched. The drill-down or content hierarchy is generated from a plist file called 'outline.plist'.

27. _Demonstrates_ how to implement and customize the 2 UIView properties of UITableView: header ('tableHeaderView') and footer ('tableFooterView'). 
    It is designed to somewhat resemble the "Contacts" application, showing you ways to design your own header and footer content. 
    It uses the UITableViewStyle: UITableViewStyleGrouped to achieve a more similar appearance as well.

28. _HeadsUpUI_ demonstrates how to implement a headsUp or HUD-like user interface over the app's primary view controller.

29. _TableSearch_ demonstrates how to use the UISearchDisplayController object in conjunction with a UISearchBar, effectively filtering in and out 
    the contents of that table. If an iPhone/iPod Touch application has large amounts of table data, this sample shows how to filter it down to a 
    manageable amount if memory usage is a concern or you just want users to scroll through less content in a table.

30. The _TableViewSuite_ shows how to use UITableView through a progression of increasingly advanced applications that display information about time zones.
    * The first example shows a simple list of the time zone names. 
      It shows how to display a simple data set in a table view.
    * The second example shows the time zones split into sections by region, with the region name as the section heading. 
      It shows how to create an indexed table view.
    * The third example shows how to set up a table view to display an index. 
      The time zones are separated into sections using UILocalizedIndexedCollation.

31. _TableViewUpdates_ demonstrates how you can use animated updates to open and close sections of a table view for viewing, 
    where each section represents a play, and each row contains a quotation from the play. 
    It also uses gesture recognizers to respond to user input:
    * A UITapGestureRecognizer to allow tapping on the section headers to expand the section;
    * A UIPinchGestureRecognizer to allow dynamic changes to the height of table view rows; and
    * A UILongPressGestureRecognizer to allow press-and-hold on table view cells to initiate an email of the quotation.

32. _ToolbarSearch_ shows how to use a search field in a toolbar. When you start a search, a table view displaying recent searches matching the 
    current search string is displayed in a popover.

33. _LazyTableImages_ demonstrates a multi-stage approach to loading and displaying a UITableView.  It displays the top paid iPhone apps on Apple's App Store.

34. _AddMusic_ demonstrates basic use of iPod library access, part of the Media Player framework. 

35. _MailComposer_ demonstrates how to target older OS versions while building with newly released APIs. 
    This sample also shows how to use the MessageUI framework to create and send email messages from within your application.

36. _BonjourWeb_ demonstrates how to find network services that are advertised by Bonjour.

37. _GenericKeychain_ shows how to navigate through the Keychain Services API provided by iOS. 
    Its demonstration leverages the Generic Keychain Item class and provides a template on how 
    to successfully set up calls to: SecItemAdd, SecItemCopyMatching, SecItemDelete, and SecItemUpdate.

Usage
-----
t.b.d.

Testing
-------
t.b.d.

[apple]: http://developer.apple.com/library/ios/

