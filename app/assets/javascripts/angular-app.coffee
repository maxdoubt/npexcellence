#= require templates/users/index
#= require templates/users/form
#= require controllers/users-controller

app = angular.module 'angular-app', ['ngRoute', 'usersController', 'templates']

app.config ['$routeProvider', '$locationProvider', '$httpProvider',
  ($routeProvider, $locationProvider, $httpProvider) ->
    $routeProvider
      .when '/admin/users',
        templateUrl: 'users/index.html'
        controller : 'UsersController'
      .when '/admin/users/:id',
        templateUrl: 'users/form.html'
        controller : 'UserController'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode true
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]