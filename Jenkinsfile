node {

    stage ('Clone') {
      checkout scm
    }
    stage ('Build') {
         sh 'sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev'
         sh 'ruby -v'
         sh 'sudo gem install bundler'
         sh 'sudo bundle install'
        // sh bundle exec rake test

        
        
    }
    stage ('Tests') {

    }

}