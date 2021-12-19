# tidbyt-twitter
Twitter application for Tidbyt devices

## Quick start
1. Install [`pixlet`](https://github.com/tidbyt/pixlet)
2. Update the default [screen_name here](https://github.com/drudge/tidbyt-twitter/blob/main/twitter.star#L16)
3. Run `pixlet serve twitter.star`
4. Go to [http://localhost:8080](http://localhost:8080)

## Options

`screen_name` - The Twitter username to show follower count of

`scroll` - If true username will scroll. defaults to true for usernames over 8 characters

## Demos

### Default
![](twitter-default.webp)

### Custom screen name + scrolling

```
> pixlet render twitter.star screen_name=timthetatman
> pixlet push --api-token ... device_id twitter.webp
```
![](twitter.webp)


## License

Copyright © 2021 [Nicholas Penree](mailto:nick+github@penree.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
