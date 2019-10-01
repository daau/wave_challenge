# Wave Software Development Challenge

### Installation
```
$ bundle install
$ yarn
$ rails db:setup
```

### Comments

I'm particularly proud of the clear separation of concerns in my implementation. You'll notice the controllers
are light and have no model logic spilling into them, which is a common problem amongst Rails applications. All of the models are also fairly lightweight (again, separation of concerns) and of the principle of least knowledge was followed as closely as reasonably possible.

The process of parsing and recording a shift report file was also done in a way that makes it open for modification in the future. Abstractions such as the Reportable and Shiftable classes make it easy to extend the program to accept Excel, Numbers, ODS files in the future, or even CSV files following another layout convention.

A final note: Tests weren't written for this application because it won't be running in production. I would absolutely write tests in a production scenario!
