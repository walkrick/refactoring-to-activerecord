## Refactoring to ActiveRecord

[Fish.ly?](https://github.com/gSchool/basic-sinatra-crud-ar) is back!

This time, you are inheriting a code base that was written by a consulting company.
The only problem is that none of them had heard about ActiveRecord! Your goal for this
exercise is to refactor the application to use ActiveRecord.

When you are done:

- The tests should still pass!
- There should not be any SQL in the Sinatra app (app.rb)
- There should be no validation code in the Sinatra app (should use ActiveRecord validations)

You cannot change any of the tests! We want to make sure that behavior is EXACTLY the same
after we introduce ActiveRecord. Since we only have acceptance tests, changing the tests
would

## Refactoring

This exercise will also give you practice refactoring code. Refactoring is defined by
[Martin Fowler](http://martinfowler.com/bliki/DefinitionOfRefactoring.html) as:

    a change made to the internal structure of software to make it easier to understand and
    cheaper to modify without changing its observable behavior

So when you are done with a refactoring, from a user's perspective there should be no difference.
That is the "observable behavior" part of the definition above. Instead, the goal refactoring is to
change the implementation of our code so that our code is cleaner and our app is easier to change
in the future.

In the example, the refactoring we are going to perform is removing all SQL interactions from the
Sinatra app and move that behavior into ActiveRecord. We will talk more in class about how to
approach this problem.
