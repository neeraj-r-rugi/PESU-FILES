# HTML Tables and Forms Complete Reference

## Table of Contents
1. [HTML Tables](#html-tables)
2. [Table Structure Elements](#table-structure-elements)
3. [Table Styling and Attributes](#table-styling-and-attributes)
4. [Advanced Table Features](#advanced-table-features)
5. [HTML Forms](#html-forms)
6. [Form Input Types](#form-input-types)
7. [Form Validation and Attributes](#form-validation-and-attributes)
8. [Advanced Form Features](#advanced-form-features)

---

## HTML Tables

### Basic Table Structure
```html
<table>
  <tr>                          <!-- Table row -->
    <td>Cell 1</td>             <!-- Table data/cell -->
    <td>Cell 2</td>
    <td>Cell 3</td>
  </tr>
  <tr>
    <td>Cell 4</td>
    <td>Cell 5</td>
    <td>Cell 6</td>
  </tr>
</table>
```

### Complete Table with Headers
```html
<table>
  <tr>
    <th>Name</th>               <!-- Table header -->
    <th>Age</th>
    <th>City</th>
  </tr>
  <tr>
    <td>John Doe</td>
    <td>30</td>
    <td>New York</td>
  </tr>
  <tr>
    <td>Jane Smith</td>
    <td>25</td>
    <td>Los Angeles</td>
  </tr>
</table>
```

---

## Table Structure Elements

### Semantic Table Structure
```html
<table>
  <caption>Employee Information Table</caption>    <!-- Table caption/title -->
  
  <thead>                                         <!-- Table header section -->
    <tr>
      <th scope="col">Employee ID</th>            <!-- Column header -->
      <th scope="col">Name</th>
      <th scope="col">Department</th>
      <th scope="col">Salary</th>
    </tr>
  </thead>
  
  <tbody>                                         <!-- Table body section -->
    <tr>
      <td>001</td>
      <td>John Doe</td>
      <td>Engineering</td>
      <td>$75,000</td>
    </tr>
    <tr>
      <td>002</td>
      <td>Jane Smith</td>
      <td>Marketing</td>
      <td>$65,000</td>
    </tr>
    <tr>
      <td>003</td>
      <td>Bob Johnson</td>
      <td>Sales</td>
      <td>$55,000</td>
    </tr>
  </tbody>
  
  <tfoot>                                         <!-- Table footer section -->
    <tr>
      <td colspan="3">Total Employees</td>        <!-- Spans 3 columns -->
      <td>3</td>
    </tr>
  </tfoot>
</table>
```

### Table Structure Elements Explained
- `<table>` - Container for entire table
- `<caption>` - Table title/description (optional)
- `<thead>` - Groups header content
- `<tbody>` - Groups body content (main data)
- `<tfoot>` - Groups footer content
- `<tr>` - Table row
- `<th>` - Table header cell
- `<td>` - Table data cell

---

## Table Styling and Attributes

### Border Attributes
```html
<!-- Basic border -->
<table border="1">
  <tr>
    <td>Cell with border</td>
    <td>Another cell</td>
  </tr>
</table>

<!-- Border with custom width -->
<table border="2">
  <tr>
    <td>Thicker border</td>
    <td>Same border</td>
  </tr>
</table>

<!-- No border -->
<table border="0">
  <tr>
    <td>No border</td>
    <td>Clean look</td>
  </tr>
</table>
```

### Spacing Attributes
```html
<!-- Cellpadding - space inside cells -->
<table border="1" cellpadding="10">
  <tr>
    <td>More space inside</td>
    <td>Comfortable reading</td>
  </tr>
</table>

<!-- Cellspacing - space between cells -->
<table border="1" cellspacing="5">
  <tr>
    <td>Space between cells</td>
    <td>Separated cells</td>
  </tr>
</table>

<!-- Combined spacing -->
<table border="1" cellpadding="8" cellspacing="3">
  <tr>
    <td>Both spacings applied</td>
    <td>Well-spaced table</td>
  </tr>
</table>
```

### Width and Height Control
```html
<table border="1" width="100%">                   <!-- Full width -->
  <tr>
    <td width="30%">30% width</td>                 <!-- Column width -->
    <td width="70%">70% width</td>
  </tr>
</table>

<table border="1" width="500">                    <!-- Fixed pixel width -->
  <tr>
    <td height="50">Fixed height cell</td>        <!-- Row height -->
    <td>Normal height</td>
  </tr>
</table>
```

### Alignment Attributes
```html
<table border="1" align="center">                 <!-- Table alignment -->
  <tr>
    <td align="left">Left aligned</td>            <!-- Horizontal alignment -->
    <td align="center">Center aligned</td>
    <td align="right">Right aligned</td>
  </tr>
  <tr>
    <td valign="top" height="60">Top</td>         <!-- Vertical alignment -->
    <td valign="middle">Middle</td>
    <td valign="bottom">Bottom</td>
  </tr>
</table>
```

### Background Colors and Images
```html
<table border="1">
  <tr bgcolor="#f0f0f0">                          <!-- Row background -->
    <td>Gray row</td>
    <td bgcolor="#ffcccc">Pink cell</td>          <!-- Cell background -->
  </tr>
  <tr>
    <td background="pattern.jpg">Background image</td>  <!-- Background image -->
    <td>Normal cell</td>
  </tr>
</table>
```

---

## Advanced Table Features

### Cell Spanning
```html
<table border="1">
  <!-- Column spanning -->
  <tr>
    <td colspan="3">This cell spans 3 columns</td>  <!-- Horizontal span -->
  </tr>
  <tr>
    <td>Column 1</td>
    <td>Column 2</td>
    <td>Column 3</td>
  </tr>
  
  <!-- Row spanning -->
  <tr>
    <td rowspan="2">Spans 2 rows</td>              <!-- Vertical span -->
    <td>Regular cell</td>
    <td>Regular cell</td>
  </tr>
  <tr>
    <!-- First cell continues from above -->
    <td>Bottom middle</td>
    <td>Bottom right</td>
  </tr>
  
  <!-- Complex spanning -->
  <tr>
    <td rowspan="2" colspan="2">Spans 2 rows and 2 columns</td>
    <td>Right cell</td>
  </tr>
  <tr>
    <td>Bottom right</td>
  </tr>
</table>
```

### Accessible Tables
```html
<table border="1">
  <caption>Sales Data by Quarter</caption>
  
  <thead>
    <tr>
      <th scope="col" id="product">Product</th>     <!-- Column scope -->
      <th scope="col" id="q1">Q1</th>
      <th scope="col" id="q2">Q2</th>
      <th scope="col" id="total">Total</th>
    </tr>
  </thead>
  
  <tbody>
    <tr>
      <th scope="row" id="laptops">Laptops</th>     <!-- Row scope -->
      <td headers="laptops q1">150</td>             <!-- Headers reference -->
      <td headers="laptops q2">200</td>
      <td headers="laptops total">350</td>
    </tr>
    <tr>
      <th scope="row" id="tablets">Tablets</th>
      <td headers="tablets q1">100</td>
      <td headers="tablets q2">120</td>
      <td headers="tablets total">220</td>
    </tr>
  </tbody>
</table>
```

### Nested Tables
```html
<table border="1">
  <tr>
    <td>Regular cell</td>
    <td>
      <!-- Nested table -->
      <table border="1" width="100%">
        <tr>
          <td>Nested cell 1</td>
          <td>Nested cell 2</td>
        </tr>
        <tr>
          <td>Nested cell 3</td>
          <td>Nested cell 4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
```

---

## HTML Forms

### Basic Form Structure
```html
<form action="process.php" method="post" target="_blank">
  <!-- Form elements go here -->
  <input type="submit" value="Submit">
</form>
```

### Form Attributes
- `action="url"` - Where to send form data
- `method="post"` or `method="get"` - How to send data
- `target="_blank"` - Where to open response
- `enctype="multipart/form-data"` - For file uploads
- `autocomplete="on"` or `autocomplete="off"` - Browser autocomplete
- `novalidate` - Disable HTML5 validation

### Complete Form Example
```html
<form action="submit.php" method="post" enctype="multipart/form-data">
  <fieldset>
    <legend>Personal Information</legend>
    
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required>
    
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
  </fieldset>
  
  <fieldset>
    <legend>Preferences</legend>
    
    <label for="newsletter">
      <input type="checkbox" id="newsletter" name="newsletter" value="yes">
      Subscribe to newsletter
    </label>
  </fieldset>
  
  <input type="submit" value="Submit Form">
  <input type="reset" value="Clear Form">
</form>
```

---

## Form Input Types

### HTML4 Input Types
```html
<!-- Text input -->
<label for="username">Username:</label>
<input type="text" id="username" name="username" size="20" maxlength="50">

<!-- Password input -->
<label for="password">Password:</label>
<input type="password" id="password" name="password" size="20">

<!-- Hidden input -->
<input type="hidden" name="userId" value="12345">

<!-- Checkbox -->
<input type="checkbox" id="agree" name="terms" value="agreed">
<label for="agree">I agree to terms and conditions</label>

<!-- Radio buttons -->
<input type="radio" id="male" name="gender" value="male">
<label for="male">Male</label>

<input type="radio" id="female" name="gender" value="female">
<label for="female">Female</label>

<input type="radio" id="other" name="gender" value="other">
<label for="other">Other</label>

<!-- Submit and Reset buttons -->
<input type="submit" value="Send Form">
<input type="reset" value="Clear Form">

<!-- Generic button -->
<input type="button" value="Click Me" onclick="alert('Clicked!')">

<!-- File upload -->
<label for="upload">Choose file:</label>
<input type="file" id="upload" name="document" accept=".pdf,.doc,.docx">
```

### HTML5 Input Types
```html
<!-- Email validation -->
<label for="email">Email Address:</label>
<input type="email" id="email" name="email" placeholder="user@example.com">

<!-- URL validation -->
<label for="website">Website:</label>
<input type="url" id="website" name="website" placeholder="https://example.com">

<!-- Telephone -->
<label for="phone">Phone Number:</label>
<input type="tel" id="phone" name="phone" placeholder="(123) 456-7890">

<!-- Number input -->
<label for="age">Age:</label>
<input type="number" id="age" name="age" min="18" max="100" step="1" value="25">

<!-- Range slider -->
<label for="volume">Volume:</label>
<input type="range" id="volume" name="volume" min="0" max="100" step="10" value="50">

<!-- Date inputs -->
<label for="birthday">Birthday:</label>
<input type="date" id="birthday" name="birthday" min="1900-01-01" max="2024-12-31">

<label for="appointment">Appointment Time:</label>
<input type="time" id="appointment" name="appointment">

<label for="meeting">Meeting DateTime:</label>
<input type="datetime-local" id="meeting" name="meeting">

<label for="month">Expiry Month:</label>
<input type="month" id="month" name="expiry">

<label for="week">Vacation Week:</label>
<input type="week" id="week" name="vacation">

<!-- Color picker -->
<label for="theme">Theme Color:</label>
<input type="color" id="theme" name="themeColor" value="#ff0000">

<!-- Search -->
<label for="search">Search:</label>
<input type="search" id="search" name="query" placeholder="Search our site...">

<!-- Multiple file upload -->
<label for="photos">Upload Photos:</label>
<input type="file" id="photos" name="photos" multiple accept="image/*">
```

### Other Form Elements
```html
<!-- Textarea -->
<label for="comments">Comments:</label>
<textarea id="comments" name="comments" rows="5" cols="40" 
          placeholder="Enter your comments here..." wrap="soft"></textarea>

<!-- Select dropdown -->
<label for="country">Country:</label>
<select id="country" name="country">
  <option value="">Select a country</option>
  <option value="us">United States</option>
  <option value="ca" selected>Canada</option>        <!-- Pre-selected -->
  <option value="uk">United Kingdom</option>
  <option value="au">Australia</option>
</select>

<!-- Multiple select -->
<label for="skills">Skills (hold Ctrl to select multiple):</label>
<select id="skills" name="skills" multiple size="4">
  <option value="html">HTML</option>
  <option value="css">CSS</option>
  <option value="js">JavaScript</option>
  <option value="php">PHP</option>
  <option value="python">Python</option>
</select>

<!-- Option groups -->
<label for="food">Favorite Food:</label>
<select id="food" name="food">
  <optgroup label="Italian">
    <option value="pizza">Pizza</option>
    <option value="pasta">Pasta</option>
    <option value="risotto">Risotto</option>
  </optgroup>
  <optgroup label="Asian">
    <option value="sushi">Sushi</option>
    <option value="ramen">Ramen</option>
    <option value="curry">Curry</option>
  </optgroup>
</select>

<!-- Button elements -->
<button type="submit">Submit Form</button>
<button type="reset">Clear Form</button>
<button type="button" onclick="validateForm()">Validate</button>

<!-- Custom button with content -->
<button type="submit">
  <img src="submit-icon.png" alt="Submit"> 
  Submit Application
</button>
```

---

## Form Validation and Attributes

### HTML5 Validation Attributes
```html
<!-- Required fields -->
<input type="text" name="name" required>
<input type="email" name="email" required>

<!-- Length validation -->
<input type="text" name="username" 
       minlength="3" maxlength="20" 
       placeholder="3-20 characters">

<!-- Number validation -->
<input type="number" name="age" 
       min="18" max="120" 
       step="1">

<!-- Pattern validation (regex) -->
<input type="text" name="phone" 
       pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" 
       placeholder="123-456-7890"
       title="Phone format: 123-456-7890">

<!-- Multiple emails -->
<input type="email" name="emails" multiple 
       placeholder="email1@example.com, email2@example.com">

<!-- File validation -->
<input type="file" name="resume" 
       accept=".pdf,.doc,.docx" 
       required>

<!-- Custom validation message -->
<input type="email" name="email" required 
       title="Please enter a valid email address">
```

### Form Control Attributes
```html
<!-- Autofocus -->
<input type="text" name="search" autofocus>

<!-- Autocomplete -->
<input type="text" name="firstName" autocomplete="given-name">
<input type="text" name="lastName" autocomplete="family-name">
<input type="email" name="email" autocomplete="email">
<input type="tel" name="phone" autocomplete="tel">

<!-- Disabled and readonly -->
<input type="text" name="id" value="12345" readonly>
<input type="text" name="locked" value="Cannot edit" disabled>

<!-- Placeholder text -->
<input type="text" name="search" placeholder="Search products...">
<textarea name="message" placeholder="Enter your message here..."></textarea>

<!-- Form association -->
<input type="text" name="external" form="mainForm">  <!-- Outside form -->
<form id="mainForm" action="submit.php" method="post">
  <!-- This input is associated with the form even though it's outside -->
</form>

<!-- List attribute with datalist -->
<input type="text" name="browser" list="browsers">
<datalist id="browsers">
  <option value="Chrome">
  <option value="Firefox">
  <option value="Safari">
  <option value="Edge">
</datalist>
```

---

## Advanced Form Features

### Form Organization
```html
<form action="register.php" method="post">
  <!-- Group related fields -->
  <fieldset>
    <legend>Account Information</legend>
    
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
    </div>
    
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
    </div>
  </fieldset>
  
  <fieldset>
    <legend>Personal Details</legend>
    
    <div class="form-group">
      <label for="fullName">Full Name:</label>
      <input type="text" id="fullName" name="fullName" required>
    </div>
    
    <div class="form-group">
      <label for="birthdate">Date of Birth:</label>
      <input type="date" id="birthdate" name="birthdate">
    </div>
  </fieldset>
  
  <fieldset>
    <legend>Preferences</legend>
    
    <div class="checkbox-group">
      <input type="checkbox" id="newsletter" name="preferences" value="newsletter">
      <label for="newsletter">Email newsletter</label>
    </div>
    
    <div class="checkbox-group">
      <input type="checkbox" id="sms" name="preferences" value="sms">
      <label for="sms">SMS notifications</label>
    </div>
  </fieldset>
  
  <div class="form-actions">
    <button type="submit">Create Account</button>
    <button type="reset">Clear Form</button>
  </div>
</form>
```

### Complex Form Example
```html
<form action="job-application.php" method="post" enctype="multipart/form-data">
  <h1>Job Application Form</h1>
  
  <!-- Personal Information -->
  <fieldset>
    <legend>Personal Information</legend>
    
    <div class="form-row">
      <div class="form-col">
        <label for="firstName">First Name *</label>
        <input type="text" id="firstName" name="firstName" required>
      </div>
      
      <div class="form-col">
        <label for="lastName">Last Name *</label>
        <input type="text" id="lastName" name="lastName" required>
      </div>
    </div>
    
    <div class="form-group">
      <label for="email">Email Address *</label>
      <input type="email" id="email" name="email" required 
             autocomplete="email">
    </div>
    
    <div class="form-group">
      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="phone" 
             pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
             placeholder="123-456-7890">
    </div>
    
    <div class="form-group">
      <label for="address">Address</label>
      <textarea id="address" name="address" rows="3"></textarea>
    </div>
  </fieldset>
  
  <!-- Job Information -->
  <fieldset>
    <legend>Job Information</legend>
    
    <div class="form-group">
      <label for="position">Position Applied For *</label>
      <select id="position" name="position" required>
        <option value="">Select a position</option>
        <optgroup label="Technical">
          <option value="developer">Software Developer</option>
          <option value="designer">UI/UX Designer</option>
          <option value="analyst">Systems Analyst</option>
        </optgroup>
        <optgroup label="Management">
          <option value="manager">Project Manager</option>
          <option value="director">Technical Director</option>
        </optgroup>
      </select>
    </div>
    
    <div class="form-group">
      <label for="experience">Years of Experience</label>
      <input type="number" id="experience" name="experience" 
             min="0" max="50" value="0">
    </div>
    
    <div class="form-group">
      <label for="salary">Expected Salary Range</label>
      <input type="range" id="salary" name="salary" 
             min="30000" max="200000" step="5000" value="60000">
      <output for="salary">$60,000</output>
    </div>
    
    <div class="form-group">
      <label for="startDate">Available Start Date</label>
      <input type="date" id="startDate" name="startDate">
    </div>
  </fieldset>
  
  <!-- Skills and Preferences -->
  <fieldset>
    <legend>Skills & Preferences</legend>
    
    <div class="form-group">
      <label>Programming Languages (select all that apply):</label>
      <div class="checkbox-group">
        <input type="checkbox" id="html" name="skills[]" value="html">
        <label for="html">HTML/CSS</label>
        
        <input type="checkbox" id="javascript" name="skills[]" value="javascript">
        <label for="javascript">JavaScript</label>
        
        <input type="checkbox" id="python" name="skills[]" value="python">
        <label for="python">Python</label>
        
        <input type="checkbox" id="java" name="skills[]" value="java">
        <label for="java">Java</label>
      </div>
    </div>
    
    <div class="form-group">
      <label>Work Preference:</label>
      <div class="radio-group">
        <input type="radio" id="remote" name="workType" value="remote">
        <label for="remote">Remote</label>
        
        <input type="radio" id="office" name="workType" value="office">
        <label for="office">Office</label>
        
        <input type="radio" id="hybrid" name="workType" value="hybrid">
        <label for="hybrid">Hybrid</label>
      </div>
    </div>
  </fieldset>
  
  <!-- Documents -->
  <fieldset>
    <legend>Documents</legend>
    
    <div class="form-group">
      <label for="resume">Resume/CV *</label>
      <input type="file" id="resume" name="resume" 
             accept=".pdf,.doc,.docx" required>
    </div>
    
    <div class="form-group">
      <label for="portfolio">Portfolio (optional)</label>
      <input type="file" id="portfolio" name="portfolio" 
             accept=".pdf,.zip" multiple>
    </div>
  </fieldset>
  
  <!-- Additional Information -->
  <fieldset>
    <legend>Additional Information</legend>
    
    <div class="form-group">
      <label for="coverLetter">Cover Letter</label>
      <textarea id="coverLetter" name="coverLetter" rows="6" 
                placeholder="Tell us why you're interested in this position..."></textarea>
    </div>
    
    <div class="form-group">
      <label for="referral">How did you hear about us?</label>
      <input type="text" id="referral" name="referral" list="referralSources">
      <datalist id="referralSources">
        <option value="Job board">
        <option value="Company website">
        <option value="Social media">
        <option value="Referral">
        <option value="Recruiter">
      </datalist>
    </div>
  </fieldset>
  
  <!-- Terms and Submission -->
  <fieldset>
    <legend>Terms & Conditions</legend>
    
    <div class="checkbox-group">
      <input type="checkbox" id="terms" name="terms" value="accepted" required>
      <label for="terms">I agree to the terms and conditions *</label>
    </div>
    
    <div class="checkbox-group">
      <input type="checkbox" id="privacy" name="privacy" value="accepted" required>
      <label for="privacy">I agree to the privacy policy *</label>
    </div>
  </fieldset>
  
  <!-- Form Actions -->
  <div class="form-actions">
    <button type="submit">Submit Application</button>
    <button type="reset" onclick="return confirm('Clear all form data?')">
      Clear Form
    </button>
    <button type="button" onclick="saveAsDraft()">Save as Draft</button>
  </div>
</form>
```

### Form Processing Methods
```html
<!-- GET method - data in URL -->
<form action="search.php" method="get">
  <input type="text" name="query" placeholder="Search...">
  <button type="submit">Search</button>
</form>
<!-- Results in URL: search.php?query=searchterm -->

<!-- POST method - data in request body -->
<form action="login.php" method="post">
  <input type="email" name="email" required>
  <input type="password" name="password" required>
  <button type="submit">Login</button>
</form>

<!-- File upload requires POST and multipart encoding -->
<form action="upload.php" method="post" enctype="multipart/form-data">
  <input type="file" name="document" accept=".pdf" required>
  <button type="submit">Upload</button>
</form>
```

This comprehensive reference covers all aspects of HTML tables and forms from your PDF, including structure, attributes, styling, validation, and advanced features.