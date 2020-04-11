# cuhk_treasure_hunt

A second hand market based in CU

## How to use backend
by Dixon

### Backend Files
file|use|completed
--|--|--
buyRequests.php | retrieve buy requests | Y
favourites.php | retrieve favourites | Y
itemsPosted.php|retrieve items posted | Y
login.php | login.. | Y
manageBuyRequests.php | create/update/delete  buy requests | Y
manageFavourites.php | create/delete favourites | Y
manageItems.php | create/update/delete items | Y
manageTransactions.php | create/update/delete transaction | N
profile.php | retrieve profile | Y
register.php | register user | N
transactions.php | retrieve transactions | Y (not yet tested)
updateProfile.php | updateProfile | N
updateReputation.php | updateReputation | N
usernameExists.php | check whether username exists | Y

### Guides to using using these files:
1. Use the static methods get/post to call these files (except for login)
2. Look into the file. If you see $_GET use get, if you see $_POST use post
3. provide the path to the get/post methods: "/data/<filename, including .php>"
4. Look into the files to see what query parameters u need
    - See what is following $_GET and $_Post
5. For get, query should be in the following format: "?parameter1=value1&parameter2=value2"
6. For post, query should be an associative array: {"parameter1":"value1", "parameter2" : "value2"}
7. For post, even if the value is number, wrap it with a ""
8. The return data for get will be a json encoded array
    - Each element of the array will be an associative array
    - Look at the php files to find out what are the keys (Look at what's following SELECT in $sql)
    - Use json.decode(response.body) to retrieve the array of associative arrays
    - Access the values as you would do normally: arr[0]['key']
9. The return data for post will be either 'success' or 'fail' (not encoded)
