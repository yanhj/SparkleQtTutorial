// File: updater_sparkle.mm
// Description: macOS and Sparkle implementation for the application's updater
// Notes: Compile updater_sparkle.mm with -fobjc-arc because this file assumes Automatic Reference Counting (ARC) is enabled

#include "updater.h"
#include <QAction>
#import <Sparkle/Sparkle.h>

// An updater delegate class that mainly takes care of updating the check for updates menu item's state
// This class can also be used to implement other updater delegate methods
@interface AppUpdaterDelegate : NSObject <SPUUpdaterDelegate>

@property (nonatomic) SPUStandardUpdaterController *updaterController;

@end

@implementation AppUpdaterDelegate

- (void)observeCanCheckForUpdatesWithAction:(QAction *)action
{
    [_updaterController.updater addObserver:self forKeyPath:NSStringFromSelector(@selector(canCheckForUpdates)) options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:(void *)action];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(canCheckForUpdates))]) {
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    @autoreleasepool {
        [_updaterController.updater removeObserver:self forKeyPath:NSStringFromSelector(@selector(canCheckForUpdates))];
    }
}

@end

// Creates and starts the updater. There's nothing else required.
Updater::Updater()
{
    @autoreleasepool {
        _updaterDelegate = [[AppUpdaterDelegate alloc] init];
        _updaterDelegate.updaterController = [[SPUStandardUpdaterController alloc] initWithStartingUpdater:YES updaterDelegate:_updaterDelegate userDriverDelegate:nil];

        [_updaterDelegate observeCanCheckForUpdatesWithAction:nil];
    }
}

// Called when the user checks for updates
void Updater::checkForUpdates()
{
    @autoreleasepool {
        [_updaterDelegate.updaterController checkForUpdates:nil];
    }
}