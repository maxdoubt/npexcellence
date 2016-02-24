#= require services/user
#= require directives/users/row

app = angular.module 'usersController', ['userService', 'userRow']

app.controller 'UsersController', ['$scope', 'User',
  ($scope, User) ->
    $scope.users = User.all {}
    console.log $scope.users
    $scope.removeUser = (user) ->
      user.$destroy {}, ->
        $scope.users = (b for b in $scope.users when b.id isnt user.id)
]

app.controller 'UserController', ['$scope', '$routeParams', '$location', 'User',
  ($scope, $routeParams, $location, User) ->
    $scope.user = User.get id: $routeParams.id, (user) ->
      $scope.userHumanPrice = user.price / 1000
      $scope.$watch 'userHumanPrice', ->
        $scope.user.price = $scope.userHumanPrice * 1000

    $scope.submitUser = ->
      callback = -> $location.path "/"
      if $scope.user.id?
        $scope.user.$update {}, callback
      else
        User.create $scope.user, callback
]
