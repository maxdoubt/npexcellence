app = angular.module 'userService', ['ngResource']

app.factory 'User', ['$resource',
  ($resource) ->
    $resource '/api/users/:id.json', {id: '@id'},
      all:
        isArray: true
      update:
        method: 'PUT'
        transformRequest: (object) -> # incapsulate the object inside the user param
          angular.toJson user: object
      destroy:
        method: 'DELETE'
        transformRequest: (object) -> # no payload in a destroy request
      create:
        method: 'POST'
        transformRequest: (object) -> # incapsulate the object inside the user param
          angular.toJson user: object
]

console.log 'service working'