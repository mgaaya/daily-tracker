# Daily Tracker — User Guide

A small, self-hosted app for tracking daily recurring tasks and building consistency over time. No account, no server — everything is saved in your browser.

## 1. Installing it

1. Unzip the app folder.
2. Host it somewhere with HTTPS — the quickest way is dragging the folder into [Netlify Drop](https://app.netlify.com/drop), which gives you a live link immediately with no sign-up.
3. Open that link on your phone in Chrome (Android).
4. Tap **Install app** (shown in the app itself, or via Chrome's menu → *Add to Home screen*).
5. It now sits on your home screen with its own icon and opens full-screen, like a normal app.

You can also just open the link in a desktop browser and use it there — installing is optional, the app works the same either way.

## 2. Adding your daily tasks

On the **today** view, type a task into the box at the bottom and press **Add** (or hit Enter). These are the things you intend to do every day — they'll reappear each morning, unchecked.

- Use the **▲ / ▼** buttons next to a task to reorder your list.
- Use **remove** to take a task off your active list. This doesn't delete its history — see *Archiving* below.

## 3. Checking things off

Tap the checkbox or the task name to mark it done. Your percentage for the day (top right) updates immediately, and everything saves automatically — no save button needed.

## 4. Viewing and editing past days

- The grid near the bottom ("Last 12 weeks") is a history map: darker green = a fuller day.
- **Click any day** to jump to it. You'll see exactly which tasks were done or missed that day.
- **The last 7 days (including today) are editable** — so if you forgot to check something off yesterday, you can still fix it.
- Anything older than 7 days is **read-only**, shown with a "read-only" badge, so your history stays honest rather than being rewritten after the fact.
- Use **prev day / next day** to step through one day at a time, or **back to today** to jump home.

## 5. Archiving tasks

Removing a task doesn't erase it — it's archived instead, so past days that included it still show accurate history. Archived tasks are hidden from your daily list.

- Click **show archived** (next to the task list, on today's view) to see them.
- **Restore** brings a task back into your active list.
- **Delete forever** permanently removes it and its name from history — use this only if you're sure.

## 6. Streaks and stats

- **Streak** — consecutive days you hit your completion threshold.
- **Best** — your longest streak on record.
- **7-day avg / 30-day avg** — your average completion percentage over recent weeks.

### Settings (tap to expand)
- **Streak threshold** — how much of your list counts as a "successful day" (default 80%). Adjustable from 50–100%.
- **Grace day** — when enabled, one missed day per week doesn't break your streak. Real life happens; this keeps the streak from feeling punishing over one bad day. Turn it off if you want a strict, no-exceptions streak.

## 7. Backing up your data

Without sync, everything is stored only in this browser. That's good for privacy, but it means:

- Clearing your browser data, reinstalling the app, or switching browsers/devices will **not** carry your history over automatically.
- Open **Backup & restore** and click **Export backup** regularly (e.g. monthly) to download a `.json` file of everything.
- To bring data back (a new device, or after clearing data), open **Backup & restore → Import backup** and select a previously exported file. This *replaces* whatever is currently in the app, so use it on a fresh install or when you're sure.

## 8. Syncing between devices (optional, free)

By default each browser keeps its own separate history. To use the same data on your phone and your computer, turn on sync. It stores your data in a **private GitHub Gist** on your own GitHub account, so it costs nothing and needs no server.

**One-time setup**
1. On GitHub, go to **Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token (classic)**.
2. Give it a name, tick **only the `gist` scope**, and generate it. Copy the token.
3. In the app, open **Sync between devices**, paste the token, and press **Connect**.
4. Repeat step 3 on every other device, using the same token (or a new one from the same account).

**How it behaves**
- Every change is pushed to the Gist a couple of seconds after you make it, and the app checks for newer data whenever you open it or return to the tab.
- The first device creates the Gist; other devices find it automatically.
- The newest change wins. Avoid editing on two devices at the exact same moment, and open the app once on a device before editing so it pulls the latest data first.
- The app still works offline. It saves locally first and syncs when you are back online.
- **Disconnect** removes the token from that device. It does not delete the Gist or your local data.
- The token is stored in that browser only and is never included in exported backups. Treat it like a password, and revoke it on GitHub if a device is lost.

## 9. Troubleshooting

- **"Install app" doesn't appear** — some browsers/OS combinations don't support installable web apps, or you've already installed it. You can always just use it as a regular browser tab.
- **My history disappeared** — most likely the browser's site data was cleared (e.g. "Clear browsing data", private/incognito mode, or an uninstall). Restore from your latest export if you have one.
- **A task looks wrong in an old day** — if you edited a task's name, name changes apply going forward and won't rewrite old days. This is expected — think of it as it recording what existed at the time.

---
The app runs on your device. Data leaves it only if you turn on sync, and then it goes only to your own private Gist.
