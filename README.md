# tidbyt-twitter
Twitter application for Tidbyt devices


## Options

`screen_name` - The Twitter username to show follower count of

`scroll` - If true username will scroll. defaults to true for usernames over 8 characters

## Demo

![](twitter.webp)

## Quick start
1. Install [`pixlet`](https://github.com/tidbyt/pixlet)
2. Update the default [screen_name here](https://github.com/drudge/tidbyt-twitter/blob/main/twitter.star#L16)
3. Run `pixlet serve twitter.star`
4. Go to [http://localhost:8080](http://localhost:8080)

## Generate for a specific Twitter username name
```
> pixlet render twitter.star screen_name=timthetatman
> pixlet push --api-token ... device_id twitter.webp
```
