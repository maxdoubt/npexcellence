#= require templates/users/row

app = angular.module 'userRow', ['templates']

app.directive 'userRow', ->
  {
    restrict: 'A'
    scope:
      user: '='
      removeUser: '&removeuser'
    templateUrl: 'users/row.html'
    controller: ($scope) ->
  }
