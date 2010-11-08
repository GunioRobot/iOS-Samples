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


Usage
-----
t.b.d.

Testing
-------
t.b.d.

[apple]: http://developer.apple.com/library/ios/

