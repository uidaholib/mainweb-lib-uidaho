# Context

The theme for the Library site will mirror the University theme, similar to this page, https://www.uidaho.edu/leadership/finance-administration/campus-planning-development

The Library uses a totally different website technology.
The Library reimplements the theme using their own stack, which is Jekyll static site generator, Liquid templates, and Bootstrap CSS. 
There is a customized version of Bootstrap "bootstrap-uidaho.css" which features the custom colors and tweaks to container sizes (see "docs/custom-bootstrap.md").
Design prefers to use Bootstrap classes first over custom or inline styles. 
Custom CSS is added to "_sass/custom.scss".
Use [Bootstrap svg icons](https://icons.getbootstrap.com/) or custom svg where icons are needed.

## Components

Components are reuseable features designed for use on the web pages. 
Each is a [Jekyll include](https://jekyllrb.com/docs/includes/), in the "_includes/components/" folder. 
They use HTML and Liquid to create the feature.
Users provide inputs via parameters. 
In some cases these can include site.data ("_data/"). 

## Testing

The dev server is run using 
`bundle exec jekyll s`

The production output is built using
`rake deploy`
