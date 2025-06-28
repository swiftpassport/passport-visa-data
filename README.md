# Passport Visa Data

🌍 **Passport Index Dataset** - Visa requirements for 199 countries. A secondary source of truth for Swift Passport Services API validation.

## 📋 Overview

This repository contains the Passport Index Dataset, which provides comprehensive visa requirement information for travelers between 199 countries. The data is sourced from the open-source [Passport Index Dataset](https://github.com/ilyankou/passport-index-dataset) and is updated regularly.

**Last Updated**: January 12, 2025

## 📊 Dataset Structure

The main dataset file `passport-index-tidy.csv` contains three columns:

| Column | Description | Example |
|--------|-------------|---------|
| Passport | Country of passport holder (origin) | United States |
| Destination | Country being traveled to | China |
| Requirement | Visa requirement status | visa required |

## 🎫 Visa Requirement Types

- **`7-360`**: Number of visa-free days allowed
- **`visa free`**: Unlimited visa-free travel (e.g., EU freedom of movement)
- **`visa on arrival`**: Visa granted upon arrival at destination
- **`eta`**: Electronic Travel Authorization required (e.g., US ESTA, Canada eTA, UK ETA)
- **`e-visa`**: Electronic visa required (apply online before travel)
- **`visa required`**: Traditional visa required (embassy/consulate application)
- **`no admission`**: Entry not allowed
- **`covid ban`**: Travel restricted due to COVID-19 (may be outdated)

## 🔗 Airtable Integration

To use this data in Airtable:

### Option 1: Direct CSV Import
1. Download the `passport-index-tidy.csv` file
2. In Airtable, create a new base or table
3. Click "Add or import" → "CSV file"
4. Upload the CSV file
5. Map the columns accordingly

### Option 2: Sync via URL (Recommended)
1. Use the raw CSV URL: `https://raw.githubusercontent.com/swiftpassport/passport-visa-data/main/passport-index-tidy.csv`
2. In Airtable, use the "Sync" feature or CSV import via URL
3. Set up automatic sync to keep data updated

### Airtable Schema Suggestion

```
Table: VisaRequirements
- Passport (Single line text)
- Destination (Single line text)  
- Requirement (Single select)
- Visa Free Days (Number) - Extract from requirement if numeric
- Last Updated (Date)
```

## 📈 Usage with Swift Passport API

This dataset can be used to:

1. **Validate Swift API responses** - Cross-reference visa requirements
2. **Fill data gaps** - Use when Swift API doesn't have specific routes
3. **Quality assurance** - Identify discrepancies for investigation
4. **Bulk operations** - Process multiple country pairs efficiently

### Example Validation Logic

```javascript
// Compare Swift API response with Passport Index data
function validateVisaRequirement(swiftData, passportIndexData) {
  const swiftReq = swiftData.visa_required;
  const indexReq = passportIndexData.requirement;
  
  // Map requirements to comparable format
  const requiresVisa = {
    'visa required': true,
    'e-visa': true,
    'eta': true,
    'visa free': false,
    'visa on arrival': false
  };
  
  return requiresVisa[swiftReq] === requiresVisa[indexReq];
}
```

## 🔄 Update Schedule

- Check for updates monthly at the [source repository](https://github.com/ilyankou/passport-index-dataset)
- Last dataset update: January 12, 2025
- This repository will be updated quarterly or when significant changes occur

## ⚠️ Important Notes

1. **Data Currency**: While regularly updated, always verify critical information with official sources
2. **COVID-19 Restrictions**: Some COVID-related restrictions may be outdated
3. **Tourist vs Business**: This data primarily covers tourist visas
4. **Transit Visas**: Not comprehensively covered in this dataset

## 📜 License

This dataset is available under the MIT License, as per the original Passport Index Dataset.

## 🤝 Contributing

To report inaccuracies or updates:
1. Open an issue in this repository
2. Include source/evidence for the correction
3. Specify which country pair needs updating

## 📞 Contact

For Swift Passport Services API inquiries: support@swiftpassport.com

---

*Data Source: [Passport Index](https://www.passportindex.org)*