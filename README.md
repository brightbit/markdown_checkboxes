# Redcarpet Checkboxes
## By [Brightbit Apps](http://www.brightbit.com)

This small, yet handy library sits on top of the [Redcarpet](https://github.com/vmg/redcarpet) markdown parser
and adds checkbox rendering functionality simply by adding `- [ ]` or `- [x]` to your markdown
(similar to how GitHub does it). To build a bare bones checkbox markdown parser:

```ruby
require 'redcarpet_checkboxes'

parser = CheckboxMarkdown.new(Redcarpet::Render::HTML.new())

markdown = <<-MARKDOWN
# Test h1
### Test h3

* Top level list
  * Second level list

- [ ] Need to do
- [x] Done!
MARKDOWN

parser.render(markdown)
```

For additional options when declaring your parser, please view [Redcarpet's](https://github.com/vmg/redcarpet)
main GitHub page. CheckboxMarkdown inherits from Redcarpet::Markdown, so the same constructor args will work.

Now, these checkboxes will be visually built and clickable, but they won't actively send a request to the server to modify any data fields.
To add some update action, throw in a block with some options like:

```ruby
parser.render(markdown) do |updated_text|
  { remote: true, method: :put, url: post_path(@post, post: { body: updated_text }) }
end
```

The `updated_text` parameter that you get in the block will be the text that your body will get changed to,
should that checkbox get clicked. You'll want to include this somewhere in a `url` option in your returning data hash.

Assuming you have your infrastructure set up accordingly, this should send an update request to your server to update
your post's body, as well as fire unobtrusive javascript after the action is completed (allowing you to do
things like prevent a page refresh, and other cool js things)

### Installation

```
gem install redcarpet_checkboxes
```

### Testing

```ruby
rake test
```
