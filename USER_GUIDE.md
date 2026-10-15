# Daily Tracker — Setup & User Guide

A personal daily-task tracker. The app is a static website (hosted on GitHub Pages) that reads and writes your data in your own free Supabase database, so it is the same on every device. You need an internet connection to use it.

---

## Part 1 — One-time setup

### 1. Create the database (Supabase, free)
1. Go to **supabase.com** and sign up (signing in with GitHub is fine).
2. Click **New project**. Pick a name (e.g. `daily-tracker`), choose a **database password** (generate one and save it in your password manager — the app never uses it), pick the region closest to you (e.g. *Central EU / Frankfurt*), and choose the **Free** plan.
3. Wait about two minutes until the project is ready.

### 2. Create the tables
1. In the left menu open **SQL Editor → New query**.
2. Open `supabase-setup.sql` from this folder, copy everything into the editor, and click **Run**.
3. You should see *Success. No rows returned*. Under **Table Editor** you will now see `tasks`, `completions` and `settings`, each marked with RLS (row-level security) enabled.

### 3. Create your login
1. Go to **Authentication → Users → Add user → Create new user**.
2. Enter your email and a strong password, and tick **Auto Confirm User**.

### 4. Switch off public sign-ups
Go to **Authentication → Sign In / Providers** (on some versions: **Authentication → Settings**) and turn **off** *Allow new users to sign up*, then save. Now only the account you created can log in.

### 5. Copy your project keys
Open **Project Settings → API** (or the **Connect** button at the top of the dashboard) and copy:
- the **Project URL** (looks like `https://abcdefgh.supabase.co`)
- the **anon / publishable key**

Never use the *service_role* / *secret* key in this app.

### 6. Put the keys into the app
Open `config.js` and replace the two placeholder values with your URL and key. Both are meant to be public: without your login they give access to nothing, because every table is protected by row-level security.

### 7. Publish on GitHub Pages
Replace the files in your repo with the files from this folder (`index.html`, `sw.js`, `config.js`, `supabase.js`, `manifest.json`, the icons) and push:

```bash
git add .
git commit -m "Switch to Supabase"
git push
```

Wait a few minutes, open your site, hard-refresh (Ctrl+Shift+R, or close and reopen the app on your phone), and sign in with the account from step 3. The Account panel shows **app version 6** when you have the new version.

### 8. Install on Android (optional)
Open the site in Chrome and tap **Install app** (or Chrome menu → *Add to Home screen*).

### 9. Clean up the old sync (if you used it)
The old GitHub Gist sync is gone. You can delete the private Gist named `daily-tracker.json` and revoke the GitHub token you created for it (GitHub → Settings → Developer settings → Personal access tokens).

---

## Part 2 — Using the app

**Tasks.** Add a daily task at the bottom of today's view. It appears every day from the day you added it. Use ▲ / ▼ to reorder and **remove** to retire a task.

**Checking off.** Tap a task. The percentage at the top updates, and the change is saved to the database straight away. The status line under *Account* shows "saved at …". If a save fails, it says **NOT saved** and the screen reloads from the database, so you never see something that was not stored.

**Past days.** Click any square in the 12-week grid, or use *prev day / next day*. The last 7 days (including today) are editable; older days are read-only. A task only counts on days from when it was created, so adding a task later never lowers your earlier days.

**Removing vs deleting.** *Remove* archives a task: it stops counting from that day on, and its history stays. *Show archived* lets you **restore** it or **delete forever** (which erases its history too).

**Streaks and averages.** A day counts toward your streak when you complete at least your threshold of tasks (default 80%). With the grace day on, one missed day per week does not break the streak. Change both under **Settings**. The 7-day and 30-day averages show your real completion.

**Several devices.** Everything lives in the database, so every device shows the same data. The app reloads from the database whenever you return to it. Use *Account → Refresh from database* to force it.

**Backups.** *Backup & restore → Export backup* downloads a `.json` copy of your data. *Import backup* adds tasks and history from a backup file, including backups from the older single-browser version of this app.

---

## Troubleshooting

- **"Invalid login credentials"** — check the email and password from step 3. If you created the user without *Auto Confirm User*, open the user in Authentication → Users and confirm it.
- **"setup needed" screen** — `config.js` still has the placeholder values.
- **"NOT saved" / permission or "row-level security" errors** — the SQL script from step 2 did not run completely. Run it again; it is safe to repeat.
- **Still on an old version** — hard-refresh, or close and reopen the installed app. GitHub Pages can take a few minutes to publish.
- **Project paused** — free Supabase projects may pause after a period of inactivity. Using the app regularly avoids this; if it happens, open the project in the Supabase dashboard and resume it. Check Supabase's current free-plan terms for details.
- **Forgot the password** — reset it in Supabase under Authentication → Users.
