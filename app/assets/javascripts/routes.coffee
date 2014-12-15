angular.module('DigApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/'
      controller: 'DigsCtrl'
      templateUrl: '/assets/index.html'
      resolve: 
        digs: (Dig) ->
          Dig.index()

    .state 'show',
      url: '/:id'
      controller: 'DigCtrl'
      templateUrl: '/assets/show.html'
      resolve: 
        dig: (Dig, $stateParams) ->
          Dig.show($stateParams.id)
        comments: (Dig, $stateParams) ->
          Dig.comments($stateParams.id)

    .state 'comment',
      url: '/:dig_id/comments/:comment_id'
      controller: 'CommentCtrl'
      templateUrl: '/assets/comment.html'
      resolve:
        comment: (Comment, $stateParams) ->
          Comment.show($stateParams.dig_id, $stateParams.comment_id)
  
