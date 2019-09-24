#!/bin/bash

# this is a temporary hack until ops has an established procedure around how we handle migrations.
# bin/envcrypt exec --
# bundle exec rails active_storage:install (Local build was not working if this section wasn't present)
# bin/envcrypt exec -- bundle exec rails db:migrate

#bin/envcrypt exec -- bundle exec puma -C config/puma.rb config.ru
bundle exec rails s 
