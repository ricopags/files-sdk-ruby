# MessageComment

## Example MessageComment Object

```
{
  "id": 1,
  "body": "What a great idea, thank you!",
  "reactions": [

  ]
}
```

* `id` (int64): Message Comment ID
* `body` (string): Comment body.
* `reactions` (array): Reactions to this comment.
* `user_id` (int64): User ID.  Provide a value of `0` to operate the current session's user.


---

## List Message Comments

```
Files::MessageComment.list(
  user_id: 1, 
  page: 1, 
  per_page: 1, 
  message_id: 1
)
```

### Parameters

* `user_id` (int64): User ID.  Provide a value of `0` to operate the current session's user.
* `page` (int64): Current page number.
* `per_page` (int64): Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
* `action` (string): Deprecated: If set to `count` returns a count of matching records rather than the records themselves.
* `message_id` (int64): Required - Message comment to return comments for.


---

## Show Message Comment

```
Files::MessageComment.find(id)
```

### Parameters

* `id` (int64): Required - Message Comment ID.


---

## Create Message Comment

```
Files::MessageComment.create(
  user_id: 1, 
  body: "body"
)
```

### Parameters

* `user_id` (int64): User ID.  Provide a value of `0` to operate the current session's user.
* `body` (string): Required - Comment body.


---

## Update Message Comment

```
Files::MessageComment.update(id, 
  body: "body"
)
```

### Parameters

* `id` (int64): Required - Message Comment ID.
* `body` (string): Required - Comment body.


---

## Delete Message Comment

```
Files::MessageComment.delete(id)
```

### Parameters

* `id` (int64): Required - Message Comment ID.


---

## Update Message Comment

```
message_comment = Files::MessageComment.find(1)
message_comment.update(
  body: "body"
)
```

### Parameters

* `id` (int64): Required - Message Comment ID.
* `body` (string): Required - Comment body.


---

## Delete Message Comment

```
message_comment = Files::MessageComment.find(1)
message_comment.delete
```

### Parameters

* `id` (int64): Required - Message Comment ID.
