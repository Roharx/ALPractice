# ✨ AL Practice – Table and Page Triggers

---

## 🔧 **Table: `50101 "My New Table"`**

### ✅ Table Triggers

* **`OnInsert`**
  Sets `"Created At"` to `CurrentDateTime`.

* **`OnModify`**
  Updates `"Changed At"` to `CurrentDateTime`.

* **`OnRename`**
  Displays a message showing the old key (`xRec.Code`) and the new key (`Rec.Code`).

* **`OnDelete`**
  Displays a message confirming deletion of the record (`Rec.Code`).

---

### 📌 Field-Level Triggers

#### **`Item No.` – `OnValidate`**

Prevents the field from being cleared once it has a value:

```al
if (xRec."Item No." <> '') and (Rec."Item No." = '') then
    Error('You cannot have an empty Item No. on this record.');
```

* `xRec."Item No." <> ''` → the previous value was not empty
* `Rec."Item No." = ''` → the user tried to clear the value

---

#### **`Item No.` – `OnLookup`**

Allows the user to select an item from the Item list:

```al
if Page.RunModal(Page::"Item List", Item) = Action::LookupOK then
    Rec."Item No." := Item."No.";
```

* Opens the **Item List** page.
* If the user confirms selection, the chosen item number is assigned to `"Item No."`.

---

## 📄 **Page: `50102 "My New Page"`**

### ✏️ Type

* `PageType = List;`
* `SourceTable = "My New Table";`

### 🗃️ Layout

* `Repeater` displays all fields.
* `"Changed At"` visibility controlled by a page variable (`IsVisible`).

---

### ⚖️ Page Triggers

* **`OnOpenPage`**
  Displays a message and hides `"Changed At"`.

* **`OnAfterGetRecord`**
  Fires for each record retrieved; shows a message.

* **`OnAfterGetCurrRecord`**
  Fires when navigating/selecting a record. Auto-fills `Description` if it's empty.

* **`OnQueryClosePage`**
  Asks for confirmation before closing the page.

* **`OnClosePage`**
  Displays a message after the page is closed.

---

## 🔹 Best Practice

* Business logic should primarily reside in the **table**.
* The **page** should be focused on UI interactions and field visibility.
