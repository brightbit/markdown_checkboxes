# Markdown Checkboxes
## By [Brightbit Apps](http://www.brightbit.com)

This small, yet handy library sits on top of the [Redcarpet](https://github.com/vmg/redcarpet) markdown parser
and adds checkbox rendering functionality simply by adding `- [ ]` or `- [x]` to your markdown
(similar to how GitHub does it). To build a bare bones checkbox markdown parser:

```ruby
require 'markdown_checkboxes'

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

### Parser
Here's the basic setup for defining your parser object:

```ruby
# Initializes a Checkbox Markdown parser
CheckboxMarkdown.new(renderer, extensions = {})
```

You have many customizable options that you can pass in to your renderer and extensions.
To see these options when declaring your parser, please view [Redcarpet's](https://github.com/vmg/redcarpet)
main GitHub page. CheckboxMarkdown inherits from Redcarpet::Markdown, so the same constructor args will work.

### Adding some serious checkbox action

Now, those checkboxes above will be visually built and clickable, but they won't actively send a request to the server to modify any data fields.
To add some update action, throw in a block with some options like:

```ruby
parser.render(markdown) do |data, updated_text|
  data.remote = true
  data.method = :put
  data.url = post_path(@post, post: { body: updated_text })
end
```

With the markdown_checkboxes DSL, you can set any attribute on the given `data` object, and
it will get set client-side as an html 'data-(attribute)=(value)' attribute on the <input /> tag for your checkboxes.
The DSL will also swap out underscores (_) for dashes (-) in your attribute names,
so, for example, `data.test_this` will translate to "data-test-this"

The `updated_text` parameter that you get in the block will be the text that your body will get changed to,
should that checkbox get clicked. You'll want to include this somewhere in a `url` attribute on the given data object.

Assuming you have your infrastructure set up accordingly, this should send an HTTP put request to your server to update
your post's body, as well as fire unobtrusive javascript after the action is completed (allowing you to do
things like prevent a page refresh, and other cool js things)

### Installation

```
gem install markdown_checkboxes
```

### Testing

```ruby
rake test
```
