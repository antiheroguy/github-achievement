# Github Achievement

This project created for earning Github Achievement.

## Steps to Run

### Install GitHub CLI and Login

Before running the project, you need to install GitHub CLI and log in to your GitHub account.

```bash
gh auth login
```

### Grant Delete Repo Permission

After logging in, you need to grant delete repository permission to GitHub CLI.

```bash
gh auth refresh -h github.com -s delete_repo
```

### Optional: Configure Environment Variables

If you want to configure the project settings such as Repo name, Branch name, Author Name, and Author Email, you can copy the .env.example file to .env and update the values accordingly.

### Execute the Achievement Script

Finally, execute the achievement.sh script to receive the achievement.

```bash
bash achievement.sh
```
