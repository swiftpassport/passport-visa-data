# Airtable Setup Guide

## 🚀 Quick Setup

### Step 1: Create Airtable Base

1. Log into Airtable
2. Click "Add a base" → "Start from scratch"
3. Name it "Visa Requirements Database"

### Step 2: Import CSV Data

1. In your new base, click the dropdown arrow next to the table name
2. Select "Import data" → "CSV file"
3. Use this URL: `https://raw.githubusercontent.com/swiftpassport/passport-visa-data/main/passport-index-tidy.csv`
4. Or download and upload the CSV file directly

### Step 3: Configure Fields

After import, configure your fields:

| Field Name | Field Type | Configuration |
|------------|------------|---------------|
| Passport | Single line text | Primary field |
| Destination | Single line text | - |
| Requirement | Single select | Color-code options |
| Visa Category | Formula | See formula below |
| Route | Formula | Concatenate Passport + Destination |
| Last Updated | Date | Default to today |

### Step 4: Add Useful Formulas

#### Visa Category Formula
```
IF(
  OR(Requirement = "visa required", Requirement = "e-visa", Requirement = "eta"),
  "Visa Required",
  IF(
    OR(Requirement = "visa free", ISNUMBER(VALUE(Requirement))),
    "No Visa Required",
    IF(
      Requirement = "visa on arrival",
      "Visa on Arrival",
      "Special Case"
    )
  )
)
```

#### Route Formula
```
CONCATENATE(Passport, " → ", Destination)
```

#### Visa Days Formula (if requirement is numeric)
```
IF(
  ISNUMBER(VALUE(Requirement)),
  VALUE(Requirement),
  BLANK()
)
```

### Step 5: Create Views

1. **All Requirements** - Default grid view
2. **Visa Required Only** - Filter where `Visa Category` = "Visa Required"
3. **Visa Free Travel** - Filter where `Visa Category` = "No Visa Required"
4. **By Passport Country** - Group by `Passport` field
5. **By Destination** - Group by `Destination` field

### Step 6: Set Up Automation (Pro feature)

1. Create automation to check for updates weekly
2. Use webhook or Zapier to sync with GitHub repository
3. Send notifications when visa requirements change

## 🔍 Advanced Features

### Create a Lookup Interface

1. Create a new Interface
2. Add filter controls for Passport and Destination
3. Display the Requirement prominently
4. Add related information and notes

### Link to Swift API Data

1. Create a second table for Swift API responses
2. Link records based on matching routes
3. Create a formula to compare requirements
4. Flag discrepancies for review

### Add Historical Tracking

1. Create a "History" table
2. Use automation to log changes
3. Track when requirements change
4. Analyze trends over time

## 📱 Mobile Access

1. Download Airtable mobile app
2. Access your base on the go
3. Perfect for checking requirements during travel planning

## 🔄 Keeping Data Updated

### Manual Update
1. Check [source repository](https://github.com/ilyankou/passport-index-dataset) monthly
2. Re-import if updates available
3. Use Airtable's dedupe feature

### Semi-Automated Update
1. Use Integromat/Make or Zapier
2. Set up weekly check of GitHub repository
3. Alert when file changes detected
4. Manual review and import

## 💡 Tips

- Use color coding for visa requirements (🟢 Free, 🟡 On Arrival, 🔴 Required)
- Add flags/emojis to country names for visual recognition
- Create a dashboard view with key statistics
- Export filtered views for specific use cases
- Use Airtable forms to collect update suggestions

## 🆘 Troubleshooting

**Import Issues**
- Ensure CSV is properly formatted
- Check for special characters in country names
- Verify all three columns are present

**Performance**
- With 40,000+ records, use filters actively
- Create focused views rather than scrolling
- Use search instead of browsing

**Sync Issues**
- Check URL accessibility
- Verify Airtable plan supports sync features
- Consider using Airtable's native CSV import

---

For Swift Passport Services integration support: support@swiftpassport.com