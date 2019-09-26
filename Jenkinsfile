node {

    stage ('Clone') {
      checkout scm
    }
    stage ('Build') {
         sh 'ruby -v'
         sh 'ls'
         sh 'sudo gem install bundler'
         sh 'sudo bundle install'
        // sh bundle exec rake test

        
        
    }
    stage ('Tests') {

    }

}