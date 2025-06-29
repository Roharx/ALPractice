# AL Practice – Table and Page Triggers

This project contains a simple AL table and list page to demonstrate the use of triggers and best practices in Business Central development.

---

## 🔧 Table: `50101 "My New Table"`

### Fields
- `Code`: Primary key.
- `Description`: Optional text.
- `Item No.`: Item reference, with validation and lookup.
- `Created At`: Auto-set on insert.
- `Changed At`: Auto-set on modify.

### Table Triggers
- **OnInsert**: Sets `Created At` to `CurrentDateTime`.
- **OnModify**: Updates `Changed At` to `CurrentDateTime`.
- **OnRename**: Shows a message with old and new keys.
- **OnDelete**: Shows a message with the record code.
- **OnValidate (Item No.)**: Prevents clearing the field if it previously had a value.
- **OnLookup (Item No.)**: Opens the Item list and assigns selected item number.

---

## 📄 Page: `50102 "My New Page"`

### Type
List page based on `My New Table`.

### Layout
Repeater showing all fields. `"Changed At"` is toggled by a page variable (`IsVisible`).

### Page Triggers
- **OnOpenPage**: Shows a message and hides `"Changed At"` field.
- **OnAfterGetRecord**: Fires for each record retrieved; shows a message.
- **OnAfterGetCurrRecord**: Fires when navigating or selecting; auto-fills description if empty.
- **OnQueryClosePage**: Asks for confirmation before closing the page.
- **OnClosePage**: Shows a message after the page is closed.

---

## ✅ Best Practices

### Table Logic
- Business logic (validation, timestamps) should live in the **table triggers**.
- Avoid writing UI-related logic in table objects.

### Page Logic
- Use **OnOpenPage** to initialize variables.
- Use **OnAfterGetRecord** for logic tied to each record (e.g. formatting).
- Use **OnAfterGetCurrRecord** for user-specific actions (e.g. auto-filling).
- Avoid modifying data directly in page triggers unless necessary.

### General
- Use messages for debugging/testing only — remove or disable in production.
- Keep triggers short and readable.
- Use proper naming, spacing, and structure.

---

## 📁 Files
- `50101 My New Table.al`: Contains table with field logic and events.
- `50102 My New Page.al`: List page with page-level logic and UI control.

