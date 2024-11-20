Getting into shape

To manage a git repo under a separate github/bitbucket/whatever account, you simply need to generate a new SSH key.

But before we can start pushing/pulling repos with your second identity, we gotta get you into shape – Let's assume your system is setup with a typical id_rsa and id_rsa.pub key pair. Right now your tree ~/.ssh looks like this

$ tree ~/.ssh
/Users/you/.ssh
├── known_hosts
├── id_rsa
└── id_rsa.pub
First, name that key pair – adding a descriptive name will help you remember which key is used for which user/remote

# change to your ~/.ssh directory
$ cd ~/.ssh

# rename the private key
$ mv id_rsa github-mainuser

# rename the public key
$ mv id_rsa.pub github-mainuser.pub
Next, let's generate a new key pair – here I'll name the new key github-otheruser

$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/github-otheruser
Now, when we look at tree ~/.ssh we see

$ tree ~/.ssh
/Users/you/.ssh
├── known_hosts
├── github-mainuser
├── github-mainuser.pub
├── github-otheruser
└── github-otheruser.pub    
Next, we need to setup a ~/.ssh/config file that will define our key configurations. We'll create it with the proper owner-read/write-only permissions

$ (umask 077; touch ~/.ssh/config)
Open that with your favourite editor, and add the following contents

Host github.com
  User git
  IdentityFile ~/.ssh/github-mainuser

Host github.com-otheruser
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-otheruser
Presumably, you'll have some existing repos associated with your primary github identity. For that reason, the "default" github.com Host is setup to use your mainuser key. If you don't want to favour one account over another, I'll show you how to update existing repos on your system to use an updated ssh configuration.

Add your new SSH key to github

Head over to github.com/settings/keys to add your new public key

You can get the public key contents using: copy/paste it to github

$ cat ~/.ssh/github-otheruser.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBVvWNQ2nO5...
Now your new user identity is all setup – below we'll show you how to use it.

Getting stuff done: cloning a repo

So how does this come together to work with git and github? Well because you can't have a chicken without and egg, we'll look at cloning an existing repo. This situation might apply to you if you have a new github account for your workplace and you were added to a company project.

Let's say github.com/someorg/somerepo already exists and you were added to it – cloning is as easy as

$ git clone github.com-otheruser:someorg/somerepo.git
That bolded portion must match the Host name we setup in your ~/.ssh/config file. That correctly connects git to the corresponding IdentityFile and properly authenticates you with github

Getting stuff done: creating a new repo

Well because you can't have a chicken without and egg, we'll look at publishing a new repo on your secondary account. This situation applies to users that are create new content using their secondary github account.

Let's assume you've already done a little work locally and you're now ready to push to github. You can follow along with me if you'd like

$ cd ~
$ mkdir somerepo
$ cd somerepo
$ git init
Now configure this repo to use your identity

$ git config user.name "Mister Manager"
$ git config user.email "someuser@some.org"
Now make your first commit

$ echo "hello world" > readme
$ git add .
$ git commit -m "first commit"
Check the commit to see your new identity was used using git log

$ git log --pretty="%H %an <%ae>"
f397a7cfbf55d44ffdf87aa24974f0a5001e1921 Mister Manager <someuser@some.org>
Alright, time to push to github! Since github doesn't know about our new repo yet, first go to github.com/new and create your new repo – name it somerepo

Now, to configure your repo to "talk" to github using the correct identity/credentials, we have add a remote. Assuming your github username for your new account is someuser ...

$ git remote add origin github.com-otheruser:someuser/somerepo.git
That bolded portion is absolutely critical and it must match the Host that we defined in your ~/.ssh/config file

Lastly, push the repo

$ git push origin master
Update an existing repo to use a new SSH configuration

Say you already have some repo cloned, but now you want to use a new SSH configuration. In the example above, we kept your existing repos in tact by assigning your previous id_rsa/id_rsa.pub key pair to Host github.com in your SSH config file. There's nothing wrong with this, but I have at least 5 github configurations now and I don't like thinking of one of them as the "default" configuration – I'd rather be explicit about each one.

Before we had this

Host github.com
  User git
  IdentityFile ~/.ssh/github-mainuser

Host github.com-otheruser
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-otheruser
So we will now update that to this (changes in bold)

Host github.com-mainuser
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-mainuser

Host github.com-otheruser
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-otheruser
But now any existing repo with a github.com remote will not work with this identity file. But don't worry, it's a simple fix.

To update any existing repo to use your new SSH configuration, update the repo's remote origin field using set-url -

$ cd existingrepo
$ git remote set-url origin github.com-mainuser:someuser/existingrepo.git
That's it. Now you can push/pull to your heart's content

SSH key file permissions

If you're running into trouble with your public keys not working correctly, SSH is quite strict on the file permissions allowed on your ~/.ssh directory and corresponding key files

As a rule of thumb, any directories should be 700 and any files should be 600 - this means they are owner-read/write-only – no other group/user can read/write them

$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/config
$ chmod 600 ~/.ssh/github-mainuser
$ chmod 600 ~/.ssh/github-mainuser.pub
$ chmod 600 ~/.ssh/github-otheruser
$ chmod 600 ~/.ssh/github-otheruser.pub
How I manage my SSH keys

### Troubleshooting multiple git accounts

1. **Ensure the correct SSH key is being used**:
   Make sure the SSH key for `github.com-personal` is added to the SSH agent:
   ```sh
   ssh-add -l
   ```

   If the key is not listed, add it:
   ```sh
   ssh-add ~/.ssh/github-personal
   ```

2. **Verify the SSH configuration**:
   Ensure your `.ssh/config` file is correctly configured:
   ```sh
   cat ~/.ssh/config
   ```

   It should contain:
   ```sh
   Host github.com-personal
     HostName github.com
     User git
     IdentityFile ~/.ssh/github-personal
   ```

3. **Test the SSH connection**:
   Test the connection to ensure the correct key is used:
   ```sh
   ssh -T git@github.com-personal
   ```

   The response should be:
   ```sh
   Hi petruburlacu! You've successfully authenticated, but GitHub does not provide shell access.
   ```

4. **Set the remote URL**:
   Set the remote URL for your repository:
   ```sh
   git remote set-url origin git@github.com-personal:petruburlacu/dotfiles.git
   ```

5. **Verify the remote URL**:
   Check the remote URL:
   ```sh
   git remote -v
   ```

   It should show:
   ```sh
   origin  git@github.com-personal:petruburlacu/dotfiles.git (fetch)
   origin  git@github.com-personal:petruburlacu/dotfiles.git (push)
   ```

6. **Push to the repository**:
   Try pushing to the repository:
   ```sh
   git push origin main
   ```

These steps should ensure that the correct SSH key and configuration are used, and the correct username (`petruburlacu`) is displayed.
