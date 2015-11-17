// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.services', 'ngResource'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleLightContent();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider, $httpProvider) {

  $httpProvider.defaults.withCredentials = true;

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider

  // setup an abstract state for the tabs directive
    .state('tab', {
    url: '/tab',
    abstract: true,
    templateUrl: 'templates/tabs.html'
  })

  // Each tab has its own nav history stack:

  .state('tab.borrow', {
    url: '/borrow',
    views: {
      'tab-borrow': {
        templateUrl: 'templates/tab-borrow.html',
        controller: 'BorrowCtrl'
      }
    }
  })

  // .state('tab.borrow-detail', {
  //   url: '/borrow/:deviceID',
  //   views: {
  //     'tab-borrow': {
  //       templateUrl: 'templates/borrow-detail.html',
  //       controller: 'BorrowDetailCtrl'
  //     }
  //   }
  // })


  .state('tab.lend', {
    url: '/lend',
    views: {
      'tab-lend': {
        templateUrl: 'templates/tab-lend.html',
        controller: 'LendCtrl'
      }
    }
  })

  .state('tab.chat-detail', {
    url: '/chats/:chatId',
    views: {
      'tab-chats': {
        templateUrl: 'templates/chat-detail.html',
         controller: 'ChatDetailCtrl'
      }
    }
  })
  
  .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html',
      controller: 'LoginCtrl'
  })

  .state('register', {
      url: '/register',
      templateUrl: 'templates/register.html',
      controller: 'RegisterCtrl'
  })

  .state('redirect', {
    url: '/redirect',
    templateUrl: 'templates/redirect.html',
    controller: 'RedirectCtrl'
  })
;

  // if none of the above states are matched, use this as the fallback

  // $urlRouterProvider.otherwise('/tab/borrow');

  $urlRouterProvider.otherwise('/login');

});
