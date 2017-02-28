## Get all Data (Array)

#### request

```
GET /api/v1/parks
```

#### response

```json
[
  {
    "id": 1,
    "name": "akiicat",
    "floor": 1,
    "number": 1,
    "phone": "0987654321"
  },
  {
    "id": 2,
    "name": "akiicat2",
    "floor": 1,
    "number": 2,
    "phone": "0987654321"
  },
  {
    "id": 3,
    "name": "akiicat3",
    "floor": 1,
    "number": 3,
    "phone": "0987654321"
  }
]
```

## Create data

- 姓名不能重複
- floor 跟 number 的組合不能相同

#### variable

| params | type | example |
| - | - | - |
| name | String | akiicat |
| floor | Integer | 1 |
| number | Integer | 1 |
| phone | String | 0987654321 |

#### request

```
POST /api/v1/parks?:params
POST /api/v1/parks?name=akiicat&floor=1&number=1&phone=0987654321
```

#### response

成功

```json
{
  "rtn": "success"
}
```

姓名重複

```json
{
  "rtn": "failed: name exists"
}
```

位置重複

```json
{
  "rtn": "failed: position exists"
}
```

## Show a data

使用者是否存在

#### request

```
GET /api/v1/parks/:name
GET /api/v1/parks/akiicat
```

#### response

使用者存在

```json
{
  "rtn": "success"
}
```

使用者不存在

```json
{
  "rtn": "failed"
}
```

## Update a data

- 姓名不能重複
- floor 跟 number 的組合可以相同

#### variable

| params | type | example |
| - | - | - |
| name | String | akiicat |
| floor | Integer | 1 |
| number | Integer | 1 |
| phone | String | 0987654321 |

#### request

```
PUT /api/v1/parks/:name?:params
PATCH /api/v1/parks/:name?:params
PUT /api/v1/parks/akiicat?number=2
PATCH /api/v1/parks/akiicat?number=2
```

#### response

似乎不管打什麼都會成功

```json
{
  "rtn": "success"
}
```

## Delete a data

#### request

```
DELETE /api/v1/parks/:name
DELETE /api/v1/parks/akiicat
```

#### response

刪除成功

```json
{
  "rtn": "success"
}
```

刪除失敗

```json
{
  "rtn": "failed"
}
```
