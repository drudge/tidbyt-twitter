# Twitter Tidbyt App
# MIT License
# by Nicholas Penree, Dec 19 2021

load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("cache.star", "cache")

TWITTER_PROFILE_URL = "https://cdn.syndication.twimg.com/widgets/followbutton/info.json?screen_names="
TWITTER_ICON = base64.decode("""
UklGRlQCAABXRUJQVlA4TEcCAAAvD0ADEB8EO5JtVdUcwd3y/yILioycp+eevVYajtw2ciS5enKe/z9uzpuusburHDeSpEi5e8xgAHp9BuKXoburINfWdrx6Ytu2Zh6li5SgbtJJGvAoM6sA28a93/f/AQDgAByA6zC9SgwYBoBhDGMgYMwSABlGHGNWmCOKIHOMOcjc7glZMab+HQ0vIvjGsHzN1pBOapCpioTGQMBtPURc5WiNOJgPTV+Bk4kyRJHuQLeURCLqRyO5sQBp1FM8Hfbija3Hr/kfPzPAVUEjj1YeUUfKl90LYRkgGKdOX329vrh79VWotzGJ5k/C0se7tdkpZ1puaj0a6k9nsyoQQ0ZkGk7Kbbh7ZtiiAI01mY6qukf7X9cWOkhrOTL1mu8Bo9L7+8uTdNkbYdOt8Wx/KV5Mhuo/lOKoKCNabu5ZhSenfhHloR+tvy6b6CaI9i93fEt0funbfbb5M7ZBS6XYXvLfdB1o6WWnLWKGxz8n79U6Y3dpozpdh0i/U1rltfLSHx29y/+0Ne7Gfy7X7+/7VZxvpz0g2rZtujnBc+y82LZtG7Vt20376cE3RPR/Ao6W1mH6dWUw3Dy+PRyF8htT70GrwZGtnvcktsbXNgOKYgyh5J8Xl36hOdE+/fn4RxBEllx96KswrtIddyEIgujrk5aJQhY01iZPGQU+D7M0Xx6vooJ5vMAN7Fd8nHmi9Dcwz+61xCxUfc0G5t/OXZg/RWoKbwC7pYhTRyIIJrXnfgFgrxzz0DRNe1PjNQAAxvPBVqfb7SyfsGAaAA==
""")

def main(config):
    screen_name=config.get('screen_name', 'npenree')
    formatted_followers_count_cached = cache.get("formatted_followers_count")
    if formatted_followers_count_cached != None:
        print("Hit! Displaying cached data.")
        formatted_followers_count = formatted_followers_count_cached
    else:
        print("Miss! Getting Twitter Follow Button JSON")
        rep = http.get(TWITTER_PROFILE_URL +screen_name)
        if rep.status_code != 200:
            fail("Twitter request failed with status %d", rep.status_code)
        formatted_followers_count = str(rep.json()[0]["formatted_followers_count"])
        cache.set("formatted_followers_count", formatted_followers_count, ttl_seconds=240)


    if config.get('scroll', False) or len(screen_name) > 8:
        screen_name_child = render.Marquee(
            width=64,
            child=render.Text(color='#3c3c3c', content="@" + screen_name),
            offset_start=5,
            offset_end=32,
        )
    else:
        screen_name_child = render.Text(color='#3c3c3c', content="@" + screen_name)
    
    return render.Root(
        child = render.Box(
            render.Column(
                expanded=True,
                main_align="space_evenly",
                cross_align="center",
                children = [
                    render.Row(
                        expanded=True,
                        main_align="space_evenly",
                        cross_align="center",
                        children = [
                            render.Image(src=TWITTER_ICON),
                            render.WrappedText(formatted_followers_count),
                        ],
                    ),
                    screen_name_child,
                ],
            ),

        ),
    )
