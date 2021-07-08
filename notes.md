# TODO:
 - explain how to store secrets

# test locally
```
git checkout -- Gemfile Gemfile.lock .overcommit.yml .rubocop.yml; overcommit --sign; unset BRANCH_NAME; unlink behaviour; unlink _spec;

export BRANCH_NAME=feature/hw2; ln -s /Users/vrabac/dev/rails/infinum/student-academy/old/2018/lecturer-specs/behaviour behaviour; source behaviour/profile; lecturer-specs run-all

