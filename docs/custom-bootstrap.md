# Custom Bootstrap Version

See [bootstrap-sass-template](https://github.com/thecdil/bootstrap-sass-template), in uidaho-mainweb branch.
The compiled output is committed to this repo as "assets/main-web/bootstrap-uidaho.css" (a copy of the customized "_variables.scss" is kept in "docs/_variables.scss" for reference, changed variables are marked with uidaho comments).

Customization values mirror the measured styles of www.uidaho.edu (which uses a Tailwind-based build) so standard Bootstrap components more easily match the theme.

Customizations:

- wider containers - $container-max-widths (640/768/1024/1280/1536, matches uidaho.edu's container scale)
- container x padding - 3rem on xl, 1.5rem on sm - add px-lg-5 on main page container
- theme colors - $theme-colors, adds the 10 U of I brand colors and sets $primary to clearwater, so focus rings, active states, form checks, and .btn-primary are on-brand teal instead of Bootstrap blue
- square corners - $enable-rounded: false, uidaho.edu has no rounded corners (the .rounded-* utilities still exist for opt-in use)
- fonts - Public Sans self-hosted variable font, weights 100-900 (files in "assets/fonts/", loaded inline by "_includes/head.html", reusable set up in "assets/main-web/uidaho-var-fonts.css")
- type scale - base 1.125rem/1.556 and explicit heading sizes matching uidaho.edu content styles; RFS scales the large headings down on small screens like the main site's responsive scale
- headings font weight 900 - $headings-font-weight

In "_variables.scss":

```scss
// uidaho colors uidaho custom
$pride-gold:  #F1B300 !default;
$raspberry: #D7003F !default;
$garnet:  #7A0017 !default;
$lupine:  #5E48FF !default;
$huckleberry: #261882 !default;
$clearwater:  #008080 !default;
$palouse: #034441 !default;
$leather: #AB4700 !default;
$bark:  #552301 !default;
$brand-black: #191919 !default;
$brand-gray: #F2F2F2 !default;
$brand-white: #ffffff !default;

// primary = clearwater (uidaho.edu uses teal for focus outlines, active states, accents)
$primary:       $clearwater !default;

// square corners like uidaho.edu
$enable-rounded:              false !default;

// body text
$body-color:                #191919;
$paragraph-margin-bottom:   1.6rem !default; // uidaho.edu content block spacing

// links are brand black (underline color is handled in "_sass/_custom.scss")
$link-color:                              #191919;

// typography, matches uidaho.edu content styles
$font-family-sans-serif: "Public Sans", system-ui, -apple-system, "Segoe UI", Roboto, "Noto Sans", "Liberation Sans", Arial, sans-serif !default;
$font-size-base:              1.125rem !default;
$line-height-base:            1.556 !default;

$h1-font-size:                3.75rem !default;
$h2-font-size:                3rem !default;
$h3-font-size:                2.5rem !default;
$h4-font-size:                1.875rem !default;
$h5-font-size:                1.5rem !default;
$h6-font-size:                1.375rem !default;

$headings-font-weight:        900 !default;
$headings-line-height:        1.1 !default;
```

Possible future build additions:

- $btn-font-weight: 700 (currently applied via .btn rule in "_sass/_custom.scss")
