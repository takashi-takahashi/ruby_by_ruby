# ruby_by_ruby
* code repository for learning "Rubyで学ぶRuby" (http://ascii.jp/elem/000/001/230/1230449/)
* in this project, a minruby interpreter is developed by ruby

## requirements
* minruby
```sh
gem install minruby
```


## usage
* normal usage
```sh
ruby ./src/minruby_interpreter.rb ./input/sample_input.rb
```

* bootstrap (joke)
```bash
ruby ./src/minruby_interpreter.rb ./src/minruby/minruby_interpreter.rb ./input/sample_input.rb
```