node {

    stage ('Clone') {
      checkout scm
    }
    stage ('Build') {
         sh 'ls'
         sh 'ruby -v'
         sh 'sudo gem install bundler'
         sh 'sudo bundle install'
        // sh bundle exec rake test

        
        
    }
    stage ('Tests') {

    }

}