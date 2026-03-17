# Student Mental Health Analysis

## Overview

This project explores whether studying abroad affects students' mental health, based on a survey conducted at a Japanese international university in 2018. The study was approved by multiple ethical and regulatory boards.

The analysis investigates whether international students show higher rates of depression compared to domestic students, and whether **length of stay** is a contributing factor.

## Dataset

**File:** `students.csv`  
**Rows:** 286 students (international + domestic)

### Key Columns

| Column | Description |
|--------|-------------|
| `inter_dom` | Student type: `Inter` (international) or `Dom` (domestic) |
| `stay` | Length of stay in years |
| `todep` | Total depression score (PHQ-9 test) |
| `tosc` | Total social connectedness score (SCS test) |
| `toas` | Total acculturative stress score (ASISS test) |
| `japanese_cate` | Japanese language proficiency (Low / Average / High) |
| `english_cate` | English language proficiency (Low / Average / High) |
| `academic` | Academic level (`Under` or `Grad`) |

## Analysis

The SQL query in `notebook.ipynb` filters for international students and groups them by length of stay, calculating average scores for depression, social connectedness, and acculturative stress.

```sql
SELECT
    stay,
    COUNT(stay) AS count_int,
    ROUND(AVG(todep), 2) AS average_phq,
    ROUND(AVG(tosc), 2) AS average_scs,
    ROUND(AVG(toas), 2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
  AND stay IS NOT NULL
GROUP BY stay
ORDER BY stay DESC;
```

## Key Findings

- International students with **longer stays** tend to show **higher depression scores** (PHQ-9).
- **Social connectedness** (SCS) scores vary across stay lengths, with no simple linear trend.
- **Acculturative stress** (ASISS) is generally elevated across all groups, suggesting cultural adjustment is an ongoing challenge regardless of how long a student has been in the country.

## Files

```
├── notebook.ipynb       # SQL analysis notebook
├── students.csv         # Survey dataset
├── mentalhealth.jpg     # Header illustration
└── README.md            # This file
```

## Source

Based on a real study published in 2019 exploring mental health outcomes of international students at a Japanese university.
