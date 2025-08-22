開發者常用工具自動化指令
好的 👍 我幫你寫一份完整的 `使用說明.md`，包含 **兩種版本（Windows .bat / Linux .sh）** 的使用方式，還有 **資料夾模式**（把捷徑放進去 `apps` 資料夾）說明。

---

# 📘 使用說明

這是一個簡單的「多程式啟動器」，可以自動開啟多個程式。
支援 **Windows (.bat)** 與 **Linux/macOS (.sh)**。

提供兩種使用模式：

1. **資料夾模式** → 把要執行的程式「捷徑 / 執行檔」放到 `apps/` 資料夾
2. **輸入模式**（舊版）→ 輸入程式路徑並儲存，下次自動打開

---

## 📂 資料夾模式

### 第一次執行

* 會自動建立 `apps` 資料夾
* 請將要執行的程式 **捷徑 (`.lnk`) 或執行檔 (`.exe` / Linux 執行檔)** 放到 `apps/` 裡

### 下次執行

* 會自動掃描 `apps/` 裡的檔案並逐一啟動

### 重置方式

* Windows

  ```bat
  launcher.bat reset
  ```
* Linux / macOS

  ```bash
  ./launcher.sh reset
  ```

---

## 🖥 Windows 版 (`launcher.bat`)

### 執行方式

直接雙擊 `launcher.bat` 或在命令列輸入：

```bat
launcher.bat
```

### 放程式

1. 第一次執行會建立一個 `apps` 資料夾
2. 將要啟動的程式捷徑或 `.exe` 放入該資料夾
3. 之後執行 `launcher.bat` 會自動打開這些程式

---

## 🐧 Linux / macOS 版 (`launcher.sh`)

### 先給執行權限

```bash
chmod +x launcher.sh
```

### 執行方式

```bash
./launcher.sh
```

### 放程式

1. 第一次執行會建立一個 `apps/` 資料夾
2. 將要啟動的執行檔放進 `apps/`（需有可執行權限 `chmod +x`）
3. 之後執行 `./launcher.sh` 就會自動打開

---

## 📑 專案結構

```
app-launcher/
├── launcher.bat   # Windows 版
├── launcher.sh    # Linux / macOS 版
├── apps/          # 放程式捷徑或執行檔
└── 使用說明.md
```

---

## ⚠️ 注意事項


* **Linux/macOS**：放可執行檔，需 `chmod +x`
* 這個啟動器會一次性打開 `apps/` 內的所有檔案


