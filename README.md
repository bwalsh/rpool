rpool
=====
Adds multi threading wrapper around the  'rinruby' gem, making the R statistics language more useful for rails applications

 
TODO - A work in progress.
* gemify
* add tests


Usage
-----

In your Gemfile

```
gem 'rinruby'
gem 'gene_pool'

```


In your model or controller


```
require 'r_pool'
RPool.instance.with_connection do |r|    
  r.eval <<EOF
  library(ggplot2)
  # ... etc  
EOF
end

```


## License

Ruby on Rails is released under the [MIT License](http://www.opensource.org/licenses/MIT).

