iOS Sample Code
=============

This are the [Apple iOS samples][apple], sometimes with some slightly modifications,
as a starting point for a personal training developing iOS applications.

Samples
-------


### General

1. _iAdSuite_ demonstrates how to manage ADBannerViews in three common scenarios, an application with a single view controller (BasicAdBanner), an application that uses a UITabBarViewController (AdBannerTabbed), and an application that uses a UINavigationViewController (AdBannerNavigation).

1. _Icons_ demonstrates the proper use of application icons on iOS.

1. _EADemo_ shows how to communicate from an iOS 3.x application, with an external accessory using the External Accessory (EA) Framework API.

1. _MailComposer_ demonstrates how to target older OS versions while building with newly released APIs. This sample also shows how to use the MessageUI framework to create and send email messages from within your application.

1. _MessageComposer_ demonstrates how to target older OS versions while building with newly released APIs. It also illustrates how to use the MessageUI framework to compose and send email and SMS messages from within your application.

1. _Teslameter_ implements a Teslameter, a magnetic field detector. It displays the raw x, y, and z magnetometer values, a plotted history of those values, and a computed magnitude (size or strength) of the magnetic field.

1. _Trailers_ is a Dashcode Project contains the Trailer web application built on stage at WWDC 09 Session 208. It fetches an RSS feed from Apple's trailers website, and then populates the UI with it, letting you browse and watch trailers of the upcoming movies.

### Data Management

1. _AccelerometerGraph_ graphs the motion of the device. It demonstrates how to use the UIAccelerometer class and how to use Quartz2D and Core Animation to provide a high performance graph view. It also demonstrates a low-pass filter that you can use to isolate the effects of gravity, and a high-pass filter that you can use to remove the effects of gravity.

1. _BatteryStatus_ demonstrates the use of the battery status properties and notifications provided via the iPhone OS SDK.

1. _CopyPasteTile_ demonstrates how to implement the copy-cut-paste feature introduced in iPhone OS v3.0.

1. _CoreDataBooks_ illustrates a number of aspects of working with the Core Data framework with an iPhone application:
    * Use of an instance of NSFetchedResultsController object to manage a collection of objects to be displayed in a table view.
    * Use of a second managed object context to isolate changes during an add operation.
    * Undo and redo. 
    * Database initialization.

1. _DateSectionTitles_ shows how to create section information for NSFetchedResultsController using dates.

1. _DocInteraction_ demonstrates how to use UIDocumentInteractionController to obtain information about documents and how to preview them. 

1. _DrillDownSave_ demonstrates how to restore the user's current location in a drill-down list style user interface and restore that location when the app is relaunched. The drill-down or content hierarchy is generated from a plist file called 'outline.plist'.

1. _InternationalMountains_ demonstrates some ways to incorporate and manage localized data in an iPhone application.

1. _LaunchMe_ demonstrates how to register a new URL type. Registering a new URL type allows other applications to interact with yours.

1. _Locations_ represents the completed project from the Core Data Tutorial for iPhone OS. The application displays a list of events, which encapsulate a time stamp and a geographical location expressed in latitude and longitude, and allows the user to add and remove events.

1. _LocateMe_ demonstrates the two primary use cases for the Core Location Framework: getting the user's location and tracking changes to the user's location. 

1. _Metronome_ demonstrates how to animate a rotation, interpret touch events, and display a simple application preferences view.

1. _PhotoLocations_ illustrates a Core Data application that uses more than one entity and uses transformable attributes. 
    It also shows inferred migration of the persistent store.

1. _QuickContacts_ demonstrates how to use the Address Book UI controllers and various properties such as displayedProperties, allowsAddingToAddressBook, and displayPerson.

1. _SeismicXML_ demonstrates how to use NSXMLParser to parse XML data.

1. _SimpleEKDemo_ shows how to use EventKit and EventKitUI frameworks to access and edit calendar data in the Calendar database.

1. _TaggedLocations_ illustrates how to manipulate attributes and relationships in an iPhone application.

1. _Touches_ includes two packages: 
    * _Touches_Classic_ demonstrates how to handle touches using UIResponder's: touches began, touches moved, and touches ended.
    * _Touches_GestureRecognizers_ demonstrates how to use UIGestureRecognizers introduced in iPhone OS 4.0 to handle touch events.

1. _WhichWayIsUp_ demonstrates how to use a UIViewController to track the orientation of the device. The application draws a small wooden crate that maintains the correct orientation as the user rotates the device.


### User Experience

1. _Accessory_ demonstrates how to implement a custom accessory view for your UITableView in the form of a checkmark button.

1. _AppPrefs_ demonstrates how to display your app's preferences or settings in the "Settings" system application.

1. _AdvencedTableViewCells_ demonstrates several different ways to handle complex UITableViewCells.

1. _AlternateViews_ demonstrates how to implement alternate or distinguishing view controllers for each particular device orientation.

1. _BubbleLevel_ demonstrates how to receive and interpret acceleration information, animate a view, and display a utility view (used for calibration).

1. _CurrentAddress_ basic use of MapKit, displaying a map view and setting its region to current location.

1. _DateCell_ demonstrates formatted display of date objects in table cells and use of UIDatePicker to edit those values.

1. _HeadsUpUI_ demonstrates how to implement a headsUp or HUD-like user interface over the app's primary view controller.

1. _HeaderFooter_ how to implement and customize the 2 UIView properties of UITableView: header ('tableHeaderView') and footer ('tableFooterView'). It is designed to somewhat resemble the "Contacts" application, showing you ways to design your own header and footer content. It uses the UITableViewStyle: UITableViewStyleGrouped to achieve a more similar appearance as well.

1. _iPhoneCoreDataRecipes_ shows how you can use view controllers, table views, and Core Data in an iPhone application. The application uses the domain of organizing and presenting recipes to show how you can use the view controller as the organizing unit to manage screenfuls of information, and how you can leverage table views to display and edit data in an elegant fashion. Amongst the techniques shown are how to:
    * Combine tab bar and navigation controllers to create a complex navigation flow
    * Customize a navigation bar
    * Implement custom table view cells that reformat themselves in response to editing, removing unnecessary information to ensure that the display remains uncluttered
    * Customize a table header view
    * Present modal views
    * Use multiple entities in a Core Data application
    * Provide a default Core Data persistent store

1. _KeyboardAccessory_ shows how to use a keyboard accessory view. 

1. _LazyTableImages_ demonstrates a multi-stage approach to loading and displaying a UITableView.  It displays the top paid iPhone apps on Apple's App Store.

1. _MoveMe_ illustrates simple drawing, touch handling, and animation using UIKit and Core Animation.

1. _MultipleDetailViews_ shows how you can use UISplitViewController to manage multiple detail views.

1. _NavBar_ demonstrates how to use UINavigationController and UIViewController classes together as building blocks to your application's user interface.  Use it as a launching pad in starting the development of your new application.

1. _PhotoPicker_ demonstrates how to choose images from the photo library, take a picture using the device's camera, and how to customize the look of the camera's user interface.

1. _Popovers_ demonstrates proper use of UIPopoverController in iOS.

1. _PageControl_ primarily demonstrates use of UIScrollView's paging functionality to use horizontal scrolling as a mechanism for navigating between different pages of content. With the iPad, this type of user interface is not really necessary since the screen is larger allowing for more content and detailed information.

1. _Scrolling_ demonstrates how to implement two different style UIScrollViews. 
The first scroller contains multiple images, showing how to layout large content with multiple chunks of data (in our case 5 separate UIImageViews).

1. _SimpleDrillDown_ shows how to create a basic drill down interface.

1. _SimpleGestureRecognizers_ shows how to use standard gesture recognizers.

1. _SimpleUndo_ illustrates how to use undo on iPhone.

1. _TransWeb_ demonstrates how to implement UIWebView with a transparent background.

1. _TableViewSuite_ shows how to use UITableView through a progression of increasingly advanced applications that display information about time zones.
    * The first example shows a simple list of the time zone names. It shows how to display a simple data set in a table view.
    * The second example shows the time zones split into sections by region, with the region name as the section heading. It shows how to create an indexed table view.
    * The third example shows how to set up a table view to display an index. The time zones are separated into sections using UILocalizedIndexedCollation.

1. _TableSearch_ demonstrates how to use the UISearchDisplayController object in conjunction with a UISearchBar, effectively filtering in and out the contents of that table. If an iPhone/iPod Touch application has large amounts of table data, this sample shows how to filter it down to a manageable amount if memory usage is a concern or you just want users to scroll through less content in a table.

1. _TableViewUpdates_ demonstrates how you can use animated updates to open and close sections of a table view for viewing, where each section represents a play, and each row contains a quotation from the play. It also uses gesture recognizers to respond to user input:
    * A UITapGestureRecognizer to allow tapping on the section headers to expand the section;
    * A UIPinchGestureRecognizer to allow dynamic changes to the height of table view rows; and
    * A UILongPressGestureRecognizer to allow press-and-hold on table view cells to initiate an email of the quotation.

1. _TouchCells_ demonstrates how to implement trackable-settable UIControls embedded in a UITableView. 
This approach is handy if an application already uses its accessory view to the right of the table cell, but still wants a check mark view that supports 
toggling states of individual row items. The green check mark on the left provides this need which is trackable (checked/unchecked) independent of table selection. 
This is a similar user interface to that of Mail's Inbox table where mail items can be individually checked and unchecked for deletion.

1. _ToolbarSearch_ shows how to use a search field in a toolbar. When you start a search, a table view displaying recent searches matching the current search string is displayed in a popover.

1. _TopPaid_ demonstrates how to design and build a universal application capable of running on both the iPhone and iPad. It shows the steps needed to make an existing iPhone application universal by introducing two unique user interface designs for both devices, yet using the same data model.

1. _TheElements_ provides access to the data contained in the Periodic Table of the Elements.  TheElements provides this data in multiple formats, allowing you to sort the data by name, atomic number, symbol name, and an elements physical state at room temperature. The application illustrates the following techniques:
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
	
1. _UICatalog_ is a catalog exhibiting many views and controls in the UIKit framework, along with their various properties and styles.


### Graphics & Animation

1. _MusicCube_ demonstrates basic use of OpenGL ES, OpenAL, Audio File Services on the iPhone for manipulating sound in a 3D environment.
1. _QuartzDemo_ is an iPhone OS application that demonstrates many of the Quartz2D APIs made available by the CoreGraphics framework. Quartz2D forms the foundation of all drawing on iPhone OS and provides facilities for drawing lines, polygons, curves, images, gradients, PDF and many other graphical facilities.

1. _PVRTextureLoader_ illustrates how to load a PVR texture file using the included PVRTexture class and then display it using OpenGL ES.

1. _Reflection_ shows how to implement a "reflection" special effect on a given UIImageView most commonly seen in iTunes and iPod player apps.

1. _ViewTransitions_ demonstrates how to perform transitions between two views using built-in Core Animation transitions.

1. _ZoomingPDFViewer_ demonstrates how to build a PDF viewer that supports zooming in or out at any level of zooming.

### Networking & Internet

1. _AdvancedURLConnections_ demonstrates various advanced networking techniques with NSURLConnection. Specifically, it demonstrates how to respond to authentication challenges, how to modify the default server trust evaluation (for example, to support a server with a self-signed certificate), and how to provide client identities.
1. _BonjourWeb_ demonstrates how to find network services that are advertised by Bonjour.

1. _MVCNetworking_ is a sample that shows how to create a network application using the Model-View-Controller design pattern.  Specifically, it displays a photo gallery by getting the gallery's XML description, thumbnails and photos from a web server, and uses Core Data to cache this information locally.

1. _Reachability_ demonstrates how to use the System Configuration framework to monitor the network state of an iPhone or iPod touch.

1. _SimpleFTPSample_ shows how to do simple FTP transfers using the NSURLConnection and CFFTPStream APIs.

1. _SimpleNetworkStreams_ shows how to do simple networking using the NSStream API.  
The goal of this sample is very limited: it does not demonstrate everything you need to implement a fully fledged networking product (more on this below), rather, 
it focuses on using the NSStream API to move a realistic amount of data across the network.

1. _SimpleURLConnections_ shows how to do simple networking using the NSURLConnection API.
1. _WiTap_ demonstrates how to achieve network communication between applications. Using Bonjour, the application both advertises itself on the local network and displays a list of other instances of this application on the network.


### Security

1. _CryptoExercise_ demonstrates the use of the two main Cryptographic API sets on the iPhone OS SDK. 
1. _GenericKeychain_ shows how to navigate through the Keychain Services API provided by iOS. Its demonstration leverages the Generic Keychain Item class and provides a template on how to successfully set up calls to: SecItemAdd, SecItemCopyMatching, SecItemDelete, and SecItemUpdate.


### Performance

1. _TopSongs_ shows you how to import data from XML into Core Data.
1. _URLCache_ demonstrate how an iPhone application can download a resource off the web, store it in the application's data directory, and use the local copy of the resource.
1. _XMLPerformance_ explores two approaches to parsing XML, focusing on performance with respect to speed, memory footprint, and user experience. 


### Maps

1. _Breadcrumb_ Demonstrates how to draw a path using the Map Kit overlay, MKOverlayView, that follows and tracks the user's current location. The included CrumbPath and CrumbPathView overlay and overlay view classes can be used for any path of points that are expected to change over time.
1. _KMLViewer_ demonstrates how to use Map Kit's Annotations and Overlays to display KML (Keyhole Markup Language) files on top of an MKMapView.

1. _WeatherMap_ demonstrates the use of the MapKit framework, displaying a map view with custom MKAnnotationViews.  

1. _WorldCities_ demonstrates basic use of MapKit, including displaying a map view and setting its region. A list of cities are stored in a plist file loaded at launch time.  Each city is represented by a "WorldCity" class which consists of a name, a latitude, and a longitude. 


### Audio & Video

1. _AddMusic_ demonstrates basic use of iPod library access, part of the Media Player framework. 

1. _aurioTouch_ demonstrates use of the remote i/o audio unit for handling audio input and output. The application can display the input audio in one of the forms, 
a regular time domain waveform, a frequency domain waveform (computed by performing a fast fourier transform on the incoming signal), and a sonogram view (a view displaying the frequency content of a signal over time, with the color signaling relative power, the y axis being frequency and the x as time). 

1. _avTouch_ demonstrates use of the AV Foundation framework for basic playback of an audio file.

1. _iPhoneMultichannelMixerTest_ demonstrates how to build an Audio Unit Graph connecting a MultiChannel Mixer instance to the RemoteIO unit.

1. _iPhoneMixerEQGraphTest_ demonstrates how to build an Audio Unit Graph connecting a MultiChannel Mixer to the iPodEQ unit then to the RemoteIO unit.

1. _iPhoneExtAudioFileConvertTest_ demonstrates the use of the ExtAudioFile API to convert from one audio format and file type to another.

1. _MoviePlayer_iPhone_ demonstrates how to use the Media Player Framework to play a movie full-screen.

1. _SpeakHere_ demonstrates basic use of Audio Queue Services, Audio File Services, and Audio Session Services on the iPhone and iPod touch for recording and playing back audio.

1. _SysSound_ demonstrates basic use of System Sound Services (declared in AudioToolbox/AudioServices.h) for playing short sounds and invoking vibration.

1. _oalTouch_ demonstrates basic use of OpenAL, Audio File Services, Core Animation, and Core Graphics Services on the iPhone for manipulating sound in a spatial environment.

Usage
-----
To build a sample, clone the repository and checkout the sample branch.


[apple]: http://developer.apple.com/library/ios/

