# Tea Subscription Service - Endpoints

`Ruby 3.2.2`<br>
`Rails 7.0.8`

## Create a new Tea Subscription
```js
  POST /api/v1/customers/:customer_id/subscriptions
```

### Validated Parameters
<br>

```| title | price | frequenty | status | customer_id |```
<br>
<br>

### Example Request
```json
  {
    "title": "Green Tea",
    "price": 13.99,
    "frequency": "monthly",
    "status": "active",
    "customer_id": 1
  }

  Status: 201 Created
```
<br>
<hr>
<br>

## Get all Customer Tea Subscriptions
```js
  GET /api/v1/customers/:customer_id/subscriptions
```

### Example Request
```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "Earl Grey",
                "price": "10.00",
                "status": "active",
                "frequency": "monthly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "Green Tea",
                "price": "10.00",
                "status": "cancelled",
                "frequency": "monthly"
            }
        },
        {
            "id": "10",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "Tea Subscription",
                "price": "8.99",
                "status": "active",
                "frequency": "Every other week"
            }
        },
        {
            "id": "11",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "Tea Subscription",
                "price": "8.99",
                "status": "active",
                "frequency": "Every other week"
            }
        }
    ]
}
  Status: 200 OK
```
<br>
<hr>
<br>

## Cancel Subscription
```js
  DELETE /api/v1/customers/:customer_id/subscriptions/:sub_id
  ```
```json
  Status: 204 No Content
```
