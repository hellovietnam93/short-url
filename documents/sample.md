*Encode an origin url*

```bash
curl --location --request POST 'https://s-u-t.herokuapp.com/encode' \
--header 'Content-Type: application/json' \
--data-raw '{
    "link": {
        "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1"
    }
}'
```

*Response*

```json
{
    "data": {
        "id": "1",
        "type": "link",
        "attributes": {
            "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1",
            "short": "https://s-u-t.herokuapp.com/s/6a325d",
            "clicked": 0
        }
    }
}
```

*Decode an short url*
```bash
curl --location --request GET 'https://s-u-t.herokuapp.com/decode?url=https://s-u-t.herokuapp.com/s/ed16d1'
```

*Response*

```bash
{
    "data": {
        "id": "1",
        "type": "link",
        "attributes": {
            "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1",
            "short": "https://s-u-t.herokuapp.com/s/6a325d",
            "clicked": 1
        }
    }
}
```
