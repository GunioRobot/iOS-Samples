iOS Sample Code
=============

This are the [Apple iOS samples][apple], sometimes with some slightly modifications,
as a starting point for a personal training developing iOS applications.

Samples
-------
1. CoreDataBooks illustrates a number of aspects of working with the Core Data framework with an iPhone application:
   * Use of an instance of NSFetchedResultsController object to manage a collection of objects to be displayed in a table view.
   * Use of a second managed object context to isolate changes during an add operation.
   * Undo and redo. 
   * Database initialization.

2. CryptoExercise demonstrates the use of the two main Cryptographic API sets on the iPhone OS SDK. 
   Asymmetric Key Encryption and random nonce generation is handled through the Security framework API set, 
   whereas, Symmetric Key Encryption is handled by the CommonCrypto API set. The CryptoExercise sample brings 
   both of these APIs together through a network service, discoverable via Bonjour, that performs a "dummy" 
   cryptographic protocol between devices found on the same subnet.
   For more information read the ReadMe.txt in the CryptoExercise branch.

3. Icons demonstrates the proper use of application icons on iOS.

4. KeyboardAccessory shows how to use a keyboard accessory view.
   The application uses a single view controller. The view controller's view is covered by a text view. 
   When you tap the text view, the view controller loads a nib file containing an accessory view that 
   it adds to the text view. The accessory view contains a button. When you tap the button, the text 
   "You tapped me." is added to the text view. The sample also shows how you can use the keyboard-will-show 
   and keyboard-will-hide notifications to animate resizing a view that is obscured by the keyboard.

5. MultipleDetailViews shows how you can use UISplitViewController to manage multiple detail views.

6. QuartzDemo is an iPhone OS application that demonstrates many of the Quartz2D APIs made available 
   by the CoreGraphics framework. Quartz2D forms the foundation of all drawing on iPhone OS and provides 
   facilities for drawing lines, polygons, curves, images, gradients, PDF and many other graphical facilities.

7. TheElements provides access to the data contained in the Periodic Table of the Elements.  TheElements 
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

8. XMLPerformance explores two approaches to parsing XML, focusing on performance with respect to 
   speed, memory footprint, and user experience. The XML data used is the current "Top 300" songs 
   from the iTunes store. The data itself is not particularly important to the sample - it was 
   chosen because of its simplicity, availability, and because the size (approximately 850KB) is 
   sufficient to demonstrate the performance issues central to the sample.

9. iPhoneCoreDataRecipes shows how you can use view controllers, table views, and Core Data in an iPhone application.
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

10. LaunchMe demonstrates how to register a new URL type. Registering a new URL type allows other applications to interact with yours.

11. ViewTransitions demonstrates how to perform transitions between two views using built-in Core Animation transitions.

12. AccelerometerGraph graphs the motion of the device. It demonstrates how to use the UIAccelerometer class and how to use Quartz2D 
    and Core Animation to provide a high performance graph view. It also demonstrates a low-pass filter that you can use to isolate 
    the effects of gravity, and a high-pass filter that you can use to remove the effects of gravity.

13. Accessory demonstrates how to implement a custom accessory view for your UITableView in the form of a checkmark button.

14. AppPrefs demonstrates how to display your app's preferences or settings in the "Settings" system application.

15. AdvencedTableViewCells demonstrates several different ways to handle complex UITableViewCells.

Usage
-----
t.b.d.

Testing
-------
t.b.d.

[apple]: http://developer.apple.com/library/ios/

