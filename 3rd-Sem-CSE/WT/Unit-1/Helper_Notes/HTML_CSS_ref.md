# HTML Tags and CSS Selectors Reference Manual

## Table of Contents
1. [HTML Structure Tags](#html-structure-tags)
2. [HTML Content Tags](#html-content-tags)
3. [HTML Form Elements](#html-form-elements)
4. [HTML5 Semantic Elements](#html5-semantic-elements)
5. [HTML Attributes](#html-attributes)
6. [CSS Selectors](#css-selectors)
7. [CSS Properties](#css-properties)
8. [CSS Box Model](#css-box-model)
9. [CSS Positioning](#css-positioning)

---

## HTML Structure Tags

### Document Structure
```html
<!DOCTYPE html>          <!-- Declares HTML5 document type -->
<html lang="en">         <!-- Root element with language attribute -->
<head>                   <!-- Contains metadata -->
<title>Page Title</title> <!-- Page title (appears in browser tab) -->
<meta charset="UTF-8">   <!-- Character encoding -->
<link rel="stylesheet" href="styles.css"> <!-- External CSS -->
<script src="script.js"></script>         <!-- External JavaScript -->
</head>
<body>                   <!-- Contains visible page content -->
</body>
</html>
```

### Basic Structure Elements
- `<html>` - Root element of HTML document
- `<head>` - Contains metadata (not visible on page)
- `<title>` - Document title (browser tab/window title)
- `<body>` - Contains all visible content
- `<meta>` - Metadata (charset, viewport, description, etc.)
- `<link>` - Links to external resources (CSS, fonts, etc.)
- `<script>` - JavaScript code or external script references
- `<style>` - Internal CSS styles

---

## HTML Content Tags

### Headings
```html
<h1>Main Heading</h1>         <!-- Most important heading -->
<h2>Section Heading</h2>      <!-- Secondary heading -->
<h3>Subsection</h3>           <!-- Third level heading -->
<h4>Minor Heading</h4>        <!-- Fourth level heading -->
<h5>Small Heading</h5>        <!-- Fifth level heading -->
<h6>Smallest Heading</h6>     <!-- Least important heading -->
```

### Text Content
```html
<p>Paragraph text content</p>                    <!-- Paragraph -->
<br>                                             <!-- Line break (self-closing) -->
<hr>                                             <!-- Horizontal rule (self-closing) -->
<strong>Bold/Important text</strong>             <!-- Strong emphasis (bold) -->
<b>Bold text</b>                                <!-- Bold (visual only) -->
<em>Emphasized text</em>                        <!-- Emphasis (italic) -->
<i>Italic text</i>                              <!-- Italic (visual only) -->
<u>Underlined text</u>                          <!-- Underlined text -->
<span>Inline container</span>                   <!-- Generic inline container -->
<div>Block container</div>                      <!-- Generic block container -->
```

### Links and Images
```html
<a href="https://example.com">Link text</a>     <!-- External link -->
<a href="page.html">Internal link</a>           <!-- Internal link -->
<a href="#section">Anchor link</a>              <!-- Link to page section -->
<a href="mailto:email@example.com">Email</a>    <!-- Email link -->

<img src="image.jpg" alt="Description">         <!-- Image (self-closing) -->
<img src="image.jpg" alt="Description" width="300" height="200"> <!-- Image with dimensions -->
```

### Lists
```html
<!-- Unordered List (bullets) -->
<ul>
  <li>First item</li>
  <li>Second item</li>
  <li>Third item</li>
</ul>

<!-- Ordered List (numbers) -->
<ol>
  <li>First step</li>
  <li>Second step</li>
  <li>Third step</li>
</ol>

<!-- Description List -->
<dl>
  <dt>Term 1</dt>
  <dd>Definition of term 1</dd>
  <dt>Term 2</dt>
  <dd>Definition of term 2</dd>
</dl>
```

### Tables
```html
<table>
  <caption>Table Caption</caption>
  <thead>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
      <th>Header 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Data 1</td>
      <td>Data 2</td>
      <td>Data 3</td>
    </tr>
    <tr>
      <td colspan="2">Spans 2 columns</td>
      <td>Data 6</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Footer 1</td>
      <td>Footer 2</td>
      <td>Footer 3</td>
    </tr>
  </tfoot>
</table>
```

### Table Attributes
- `border="1"` - Table border width
- `cellpadding="5"` - Space inside cells
- `cellspacing="5"` - Space between cells
- `colspan="2"` - Cell spans multiple columns
- `rowspan="2"` - Cell spans multiple rows
- `align="center"` - Horizontal alignment
- `valign="top"` - Vertical alignment

---

## HTML Form Elements

### Form Structure
```html
<form action="submit.php" method="post" target="_blank">
  <!-- Form elements go here -->
</form>
```

### Input Types
```html
<!-- HTML4 Input Types -->
<input type="text" name="username" placeholder="Enter username">
<input type="password" name="password" placeholder="Password">
<input type="checkbox" name="agree" value="yes"> I agree
<input type="radio" name="gender" value="male"> Male
<input type="radio" name="gender" value="female"> Female
<input type="submit" value="Submit">
<input type="reset" value="Reset">
<input type="button" value="Click Me" onclick="alert('Clicked!')">
<input type="hidden" name="userId" value="123">
<input type="file" name="upload" accept=".jpg,.png,.pdf">

<!-- HTML5 Input Types -->
<input type="email" name="email" placeholder="email@example.com">
<input type="url" name="website" placeholder="https://example.com">
<input type="tel" name="phone" placeholder="123-456-7890">
<input type="number" name="age" min="1" max="100" step="1">
<input type="range" name="volume" min="0" max="100" value="50">
<input type="date" name="birthday">
<input type="time" name="appointment">
<input type="datetime-local" name="meeting">
<input type="month" name="expiry">
<input type="week" name="vacation">
<input type="color" name="theme">
<input type="search" name="query" placeholder="Search...">
```

### Other Form Elements
```html
<textarea name="comments" rows="4" cols="50" placeholder="Enter comments"></textarea>

<select name="country">
  <option value="">Choose country</option>
  <option value="us">United States</option>
  <option value="uk" selected>United Kingdom</option>
  <option value="ca">Canada</option>
</select>

<button type="submit">Submit Form</button>
<button type="reset">Reset Form</button>
<button type="button" onclick="doSomething()">Click Me</button>

<fieldset>
  <legend>Personal Information</legend>
  <!-- Related form elements -->
</fieldset>

<label for="username">Username:</label>
<input type="text" id="username" name="username">
```

### HTML5 Form Attributes
```html
<input type="text" 
       name="username" 
       placeholder="Enter username"
       required
       autofocus
       autocomplete="off"
       pattern="[A-Za-z0-9]{3,20}"
       minlength="3"
       maxlength="20">

<input type="email" 
       name="email"
       placeholder="email@example.com"
       required
       multiple>

<input type="file" 
       name="documents"
       accept=".pdf,.doc,.docx"
       multiple>
```

---

## HTML5 Semantic Elements

### Layout Semantics
```html
<header>
  <nav>
    <ul>
      <li><a href="#home">Home</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>
</header>

<main>
  <section>
    <h1>Main Content Section</h1>
    <article>
      <h2>Article Title</h2>
      <p>Article content...</p>
    </article>
    
    <aside>
      <h3>Related Information</h3>
      <p>Sidebar content...</p>
    </aside>
  </section>
</main>

<footer>
  <p>&copy; 2024 Website Name. All rights reserved.</p>
</footer>
```

### Content Semantics
```html
<figure>
  <img src="chart.jpg" alt="Sales Chart">
  <figcaption>Sales data for Q4 2024</figcaption>
</figure>

<details>
  <summary>Click to expand</summary>
  <p>Hidden content that can be toggled</p>
</details>

<mark>Highlighted text</mark>
<time datetime="2024-01-15">January 15, 2024</time>

<address>
  Contact us at: <a href="mailto:info@example.com">info@example.com</a><br>
  123 Main Street, City, State 12345
</address>
```

### Multimedia Elements
```html
<!-- Audio -->
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
  <source src="audio.ogg" type="audio/ogg">
  Your browser does not support audio.
</audio>

<!-- Video -->
<video controls width="640" height="480">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Your browser does not support video.
</video>
```

---

## HTML Attributes

### Global Attributes (Available on all elements)
```html
<div id="unique-identifier">        <!-- Unique identifier -->
<div class="css-class another">     <!-- CSS classes (space-separated) -->
<div style="color: red;">           <!-- Inline CSS styles -->
<div title="Tooltip text">          <!-- Tooltip on hover -->
<div data-custom="value">           <!-- Custom data attributes -->
<div lang="en">                     <!-- Language -->
<div hidden>                        <!-- Hide element -->
<div contenteditable="true">        <!-- Make element editable -->
<div draggable="true">             <!-- Make element draggable -->
<div tabindex="1">                 <!-- Tab order for keyboard navigation -->
```

### Common Specific Attributes
```html
<!-- Links -->
<a href="url" target="_blank" rel="noopener">

<!-- Images -->
<img src="image.jpg" alt="Description" width="300" height="200" loading="lazy">

<!-- Forms -->
<input type="text" name="field" value="default" placeholder="hint" required disabled readonly>
<form action="submit.php" method="post" enctype="multipart/form-data">

<!-- Tables -->
<td colspan="2" rowspan="3" align="center" valign="top">

<!-- Media -->
<audio src="audio.mp3" controls autoplay loop muted preload="auto">
<video src="video.mp4" controls autoplay loop muted poster="thumbnail.jpg">
```

---

## CSS Selectors

### Basic Selectors
```css
/* Element Selector */
p { color: blue; }                    /* All <p> elements */
h1 { font-size: 24px; }              /* All <h1> elements */

/* Class Selector */
.highlight { background: yellow; }     /* Elements with class="highlight" */
.container { width: 100%; }           /* Elements with class="container" */

/* ID Selector */
#header { background: navy; }          /* Element with id="header" */
#sidebar { width: 200px; }            /* Element with id="sidebar" */

/* Universal Selector */
* { margin: 0; padding: 0; }          /* All elements */
```

### Compound Selectors
```css
/* Multiple Classes */
.large.highlight { font-size: 20px; }  /* Elements with BOTH classes */

/* Element with Class */
p.important { font-weight: bold; }     /* <p> elements with class="important" */
div.container { max-width: 1200px; }   /* <div> elements with class="container" */

/* Element with ID */
div#main { background: white; }        /* <div> element with id="main" */
```

### Grouping Selectors
```css
/* Multiple Selectors (comma-separated) */
h1, h2, h3 { color: navy; }           /* All h1, h2, and h3 elements */
.header, .footer { background: gray; } /* Elements with either class */
#nav, #sidebar { border: 1px solid; } /* Elements with either ID */
```

### Descendant Selectors
```css
/* Descendant Selector (space) */
.container p { margin: 10px; }        /* <p> elements inside .container */
#sidebar ul { list-style: none; }     /* <ul> elements inside #sidebar */

/* Child Selector (>) */
.menu > li { display: inline; }       /* Direct <li> children of .menu */
#content > h2 { border-bottom: 1px; } /* Direct <h2> children of #content */

/* Adjacent Sibling (+) */
h1 + p { margin-top: 0; }            /* <p> immediately after <h1> */

/* General Sibling (~) */
h2 ~ p { color: gray; }              /* All <p> siblings after <h2> */
```

### Attribute Selectors
```css
/* Has Attribute */
[title] { cursor: help; }             /* Elements with title attribute */
[data-role] { position: relative; }   /* Elements with data-role attribute */

/* Exact Attribute Value */
[type="text"] { border: 1px solid; }  /* Elements with type="text" */
[class="highlight"] { background: yellow; } /* Exact class match */

/* Attribute Contains Word */
[class~="nav"] { display: flex; }     /* Class contains "nav" as whole word */

/* Attribute Starts With */
[href^="https"] { color: green; }     /* href starts with "https" */
[class^="btn"] { padding: 10px; }     /* class starts with "btn" */

/* Attribute Ends With */
[href$=".pdf"] { font-weight: bold; } /* href ends with ".pdf" */
[src$=".jpg"] { border-radius: 5px; } /* src ends with ".jpg" */

/* Attribute Contains Substring */
[href*="example"] { text-decoration: underline; } /* href contains "example" */
```

### Pseudo-Class Selectors
```css
/* Link States */
a:link { color: blue; }               /* Unvisited links */
a:visited { color: purple; }          /* Visited links */
a:hover { color: red; }               /* Mouse hover */
a:active { color: orange; }           /* Being clicked */
a:focus { outline: 2px solid; }       /* Keyboard focus */

/* Structure Pseudo-Classes */
:first-child { margin-top: 0; }       /* First child element */
:last-child { margin-bottom: 0; }     /* Last child element */
:nth-child(2n) { background: #f0f0f0; } /* Even children */
:nth-child(odd) { background: white; } /* Odd children */
:nth-child(3n+1) { color: red; }      /* Every 3rd starting from 1st */

/* Type-based Structure */
:first-of-type { font-weight: bold; } /* First element of its type */
:last-of-type { border-bottom: none; } /* Last element of its type */
:nth-of-type(2) { color: blue; }      /* Second element of its type */
:only-child { text-align: center; }   /* Only child element */
:only-of-type { font-style: italic; } /* Only element of its type */

/* Form States */
input:focus { border-color: blue; }   /* Input has focus */
input:disabled { opacity: 0.5; }      /* Disabled input */
input:checked { transform: scale(1.1); } /* Checked checkbox/radio */
input:required { border-left: 3px solid red; } /* Required field */
input:valid { border-color: green; }  /* Valid input */
input:invalid { border-color: red; }  /* Invalid input */

/* Other States */
:empty { display: none; }             /* Empty elements */
:not(.special) { color: black; }      /* Elements without .special class */
```

### Pseudo-Element Selectors
```css
/* Content Pseudo-Elements */
::before { content: "★ "; }           /* Insert content before element */
::after { content: " →"; }            /* Insert content after element */

/* Text Pseudo-Elements */
::first-letter { font-size: 2em; }    /* First letter of element */
::first-line { font-weight: bold; }   /* First line of element */

/* Selection */
::selection { background: yellow; }    /* Selected text */
```

---

## CSS Properties

### Text Properties
```css
.text-styles {
  color: #333333;                     /* Text color */
  font-family: Arial, sans-serif;     /* Font family */
  font-size: 16px;                    /* Font size */
  font-weight: bold;                  /* Font weight (normal, bold, 100-900) */
  font-style: italic;                 /* Font style (normal, italic, oblique) */
  text-align: center;                 /* Text alignment (left, center, right, justify) */
  text-decoration: underline;         /* Text decoration (none, underline, line-through) */
  text-transform: uppercase;          /* Text transform (none, uppercase, lowercase, capitalize) */
  line-height: 1.5;                  /* Line height */
  letter-spacing: 2px;               /* Space between letters */
  word-spacing: 5px;                 /* Space between words */
  text-indent: 20px;                 /* First line indentation */
  white-space: nowrap;               /* White space handling */
}
```

### Background Properties
```css
.background-styles {
  background-color: #f0f0f0;         /* Background color */
  background-image: url('image.jpg'); /* Background image */
  background-repeat: no-repeat;       /* Image repeat (repeat, no-repeat, repeat-x, repeat-y) */
  background-position: center top;    /* Image position */
  background-size: cover;            /* Image size (auto, contain, cover, 100px 50px) */
  background-attachment: fixed;       /* Scroll behavior (scroll, fixed, local) */
  
  /* Shorthand */
  background: #fff url('bg.jpg') no-repeat center/cover;
}
```

### Border Properties
```css
.border-styles {
  border-width: 2px;                 /* Border width */
  border-style: solid;               /* Border style (solid, dashed, dotted, double, etc.) */
  border-color: #333;                /* Border color */
  border-radius: 10px;               /* Rounded corners */
  
  /* Individual sides */
  border-top: 1px solid red;
  border-right: 2px dashed blue;
  border-bottom: 3px dotted green;
  border-left: 4px double orange;
  
  /* Individual corner radius */
  border-top-left-radius: 5px;
  border-top-right-radius: 10px;
  border-bottom-right-radius: 15px;
  border-bottom-left-radius: 20px;
  
  /* Shorthand */
  border: 2px solid #333;
}
```

### Spacing Properties
```css
.spacing {
  margin: 20px;                      /* All sides */
  margin: 10px 20px;                 /* Top/bottom, left/right */
  margin: 10px 15px 20px 25px;       /* Top, right, bottom, left */
  
  padding: 15px;                     /* All sides */
  padding: 10px 20px;                /* Top/bottom, left/right */
  padding: 5px 10px 15px 20px;       /* Top, right, bottom, left */
  
  /* Individual sides */
  margin-top: 10px;
  margin-right: 20px;
  margin-bottom: 15px;
  margin-left: 5px;
  
  padding-top: 8px;
  padding-right: 12px;
  padding-bottom: 16px;
  padding-left: 4px;
}
```

### Display and Visibility
```css
.display-options {
  display: block;                    /* Block element */
  display: inline;                   /* Inline element */
  display: inline-block;             /* Inline-block element */
  display: flex;                     /* Flexbox container */
  display: grid;                     /* Grid container */
  display: none;                     /* Hide element */
  
  visibility: hidden;                /* Hide but keep space */
  visibility: visible;               /* Show element */
  
  opacity: 0.5;                     /* Transparency (0-1) */
}
```

---

## CSS Box Model

### Box Model Properties
```css
.box-model {
  /* Content dimensions */
  width: 300px;
  height: 200px;
  min-width: 200px;
  max-width: 400px;
  min-height: 100px;
  max-height: 300px;
  
  /* Box sizing */
  box-sizing: border-box;           /* Include padding and border in width/height */
  box-sizing: content-box;          /* Default: only content in width/height */
  
  /* Padding (inside border) */
  padding: 20px;
  
  /* Border */
  border: 2px solid #333;
  
  /* Margin (outside border) */
  margin: 15px;
  
  /* Outline (outside margin, doesn't affect layout) */
  outline: 1px dashed red;
  outline-offset: 5px;
}
```

---

## CSS Positioning

### Position Property
```css
.positioning {
  position: static;                  /* Default: normal document flow */
  position: relative;                /* Relative to normal position */
  position: absolute;                /* Relative to positioned ancestor */
  position: fixed;                   /* Relative to viewport */
  position: sticky;                  /* Sticky positioning */
  
  /* Position coordinates (used with relative, absolute, fixed, sticky) */
  top: 10px;
  right: 20px;
  bottom: 30px;
  left: 40px;
  
  /* Z-index (stacking order) */
  z-index: 100;
}
```

### Float and Clear
```css
.floating {
  float: left;                      /* Float left */
  float: right;                     /* Float right */
  float: none;                      /* No float */
  
  clear: left;                      /* Clear left floats */
  clear: right;                     /* Clear right floats */
  clear: both;                      /* Clear all floats */
  clear: none;                      /* No clear */
}
```

### Overflow
```css
.overflow-control {
  overflow: visible;                /* Content overflows (default) */
  overflow: hidden;                 /* Hide overflowing content */
  overflow: scroll;                 /* Always show scrollbars */
  overflow: auto;                   /* Show scrollbars when needed */
  
  overflow-x: hidden;               /* Horizontal overflow */
  overflow-y: scroll;               /* Vertical overflow */
}
```

## Media Queries and Responsive Design
```css
/* Mobile First Approach */
.container {
  width: 100%;
  padding: 10px;
}

/* Tablet and up */
@media screen and (min-width: 768px) {
  .container {
    width: 750px;
    margin: 0 auto;
  }
}

/* Desktop and up */
@media screen and (min-width: 1024px) {
  .container {
    width: 1200px;
  }
}

/* Print styles */
@media print {
  .no-print {
    display: none;
  }
}
```

## Common CSS Patterns

### Center Alignment
```css
/* Horizontal centering */
.center-horizontal {
  margin: 0 auto;                   /* Block element */
  text-align: center;               /* Inline content */
}

/* Vertical centering */
.center-vertical {
  display: flex;
  align-items: center;              /* Flex method */
  
  /* OR */
  position: relative;
  top: 50%;
  transform: translateY(-50%);      /* Transform method */
}

/* Both horizontal and vertical */
.center-both {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

### Clearfix (for floated elements)
```css
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```

### Button Styling
```css
.button {
  display: inline-block;
  padding: 10px 20px;
  background: #007bff;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}

.button:hover {
  background: #0056b3;
}

.button:active {
  transform: translateY(1px);
}
```

This reference manual covers the essential HTML tags and CSS selectors from your PDF, organized in a practical way for quick reference and learning.