/*
     File: KeyboardAccessoryAppDelegate.m
 Abstract: Simple application delegate that displays the application's window. 
 
  Version: 1.4
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */
#import "AppDelegate.h"
#import "ContentController.h"
#import "NoteListViewController.h"
#import "DetailViewController.h"

NSString* kTextColorKey			  = @"textColorKey";
NSString* kBackgroundColorKey	= @"backgroundColorKey";


@implementation AppDelegate

@synthesize window,contentController, backgroundColor, textColor;


/**
 *
 */
- (void)setupByPreferences
{ NSString *testValue = [[NSUserDefaults standardUserDefaults] stringForKey:kTextColorKey];
  
	if (testValue == nil)
	{ // no default values have been set, create them here based on what's in our Settings bundle info
		//
		NSString *pathStr = [[NSBundle mainBundle] bundlePath];
		NSString *settingsBundlePath = [pathStr stringByAppendingPathComponent:@"Settings.bundle"];
		NSString *finalPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];
    
		NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
		NSArray *prefSpecifierArray = [settingsDict objectForKey:@"PreferenceSpecifiers"];
    
		NSNumber *textColorDefault = nil;
		NSNumber *backgroundColorDefault = nil;
		
		NSDictionary *prefItem;
		for (prefItem in prefSpecifierArray)
		{ NSString* keyValueStr  = [prefItem objectForKey:@"Key"];
			id        defaultValue = [prefItem objectForKey:@"DefaultValue"];
			
			if ([keyValueStr isEqualToString:kTextColorKey])
				textColorDefault = defaultValue;
			else if ([keyValueStr isEqualToString:kBackgroundColorKey])
				backgroundColorDefault = defaultValue;
		} // of for
    
		// since no default values have been set (i.e. no preferences file created), create it here		
		NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                 textColorDefault, kTextColorKey,
                                 backgroundColorDefault, kBackgroundColorKey,
                                 nil];
    
		[[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
		[[NSUserDefaults standardUserDefaults] synchronize];
	} // of if
	
	// we're ready to go, so lastly set the key preference values
	textColor       = [[NSUserDefaults standardUserDefaults] integerForKey:kTextColorKey];
	backgroundColor = [[NSUserDefaults standardUserDefaults] integerForKey:kBackgroundColorKey];
} // of setupByPreferences()

/**
 * we are being notified that our preferences have changed (user changed them in the Settings app)
 * so read in the changes and update our UI.
 */
- (void)defaultsChanged:(NSNotification *)notif
{ [self setupByPreferences];
  
  [self.contentController.detailViewController updateSettings];
} // of defaultsChanged()

/**
 *
 */
- (void)applicationDidFinishLaunching:(UIApplication *)application 
{ if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    [[NSBundle mainBundle] loadNibNamed:@"Content_iPhone" owner:self options:nil];
  else
    [[NSBundle mainBundle] loadNibNamed:@"Content_iPad" owner:self options:nil];
  
  self.contentController.managedObjectContext = self.managedObjectContext;
  
  [window addSubview:self.contentController.view];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(defaultsChanged:)
                                               name:NSUserDefaultsDidChangeNotification
                                             object:nil];
  
	[self setupByPreferences];
  
  [window makeKeyAndVisible];
} // of applicationDidFinishLaunching()

/**
 *
 */
- (void)saveApplicationState
{ 
  [self.contentController.masterViewController saveData];
} // of saveApplicationState()

/**
 *
 */
- (void)applicationWillTerminate:(UIApplication *)application 
{ [self saveApplicationState]; }

/**
 *
 */
- (void)applicationWillResignActive:(UIApplication *)application 
{ [self saveApplicationState]; }

/**
 *
 */
- (void)dealloc 
{ [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUserDefaultsDidChangeNotification object:nil];

  [managedObjectContext release];
  [managedObjectModel release];
  [persistentStoreCoordinator release];
  
  [contentController release];
  [window release];
  [super dealloc];
} // of dealloc()

#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory 
{	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]; }

#pragma mark -
#pragma mark Core Data stack


/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext 
{ if (managedObjectContext != nil) 
    return managedObjectContext;
	
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];

  if (coordinator != nil)
  { managedObjectContext = [NSManagedObjectContext new];
   
    [managedObjectContext setPersistentStoreCoordinator: coordinator];
  } // of if
  
  return managedObjectContext;
} // of managedObjectContext:


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel 
{ if (managedObjectModel != nil)
    return managedObjectModel;
  
  managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
  
  return managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator 
{ if (persistentStoreCoordinator != nil)
  return persistentStoreCoordinator;
  
	NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"Notes.sqlite"];
  
	/*
	 Set up the store.
	 For the sake of illustration, provide a pre-populated default store.
	 */
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
  // If the expected store doesn't exist, copy the default store.
	if (![fileManager fileExistsAtPath:storePath]) 
  {	NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"Notes" ofType:@"sqlite"];
		
    if (defaultStorePath) 
			[fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
	} // of if
	
	NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
	
	NSError *error;
  
  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
  
  if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) 
  {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
  }    
  
  return persistentStoreCoordinator;
}
@end
