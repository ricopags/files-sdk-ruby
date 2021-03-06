# Folder

The Files::Folder object emulates a Ruby Dir object and can be used in
may places where a Ruby Dir object can be used.

Files::Dir is an alias of Files::Folder

## Example Folder Object

```
{
  "id": 1,
  "path": "path/file.txt",
  "display_name": "file.txt",
  "type": "file",
  "size": 1024,
  "mtime": "2000-01-01T01:00:00Z",
  "provided_mtime": "2000-01-01T01:00:00Z",
  "crc32": "70976923",
  "md5": "17c54824e9931a4688ca032d03f6663c",
  "mime_type": "application/octet-stream",
  "region": "us-east-1",
  "permissions": "rpw",
  "subfolders_locked?": true,
  "download_uri": "https://mysite.files.com/...",
  "priority_color": "red",
  "preview_id": 1,
  "preview": ""
}
```

* `id` (int64): File/Folder ID
* `path` (string): File/Folder path This must be slash-delimited, but it must neither start nor end with a slash. Maximum of 5000 characters.
* `display_name` (string): File/Folder display name
* `type` (string): Type: `directory` or `file`.
* `size` (int64): File/Folder size
* `mtime` (date-time): File last modified date/time, according to the server.  This is the timestamp of the last Files.com operation of the file, regardless of what modified timestamp was sent.
* `provided_mtime` (date-time): File last modified date/time, according to the client who set it.  Files.com allows desktop, FTP, SFTP, and WebDAV clients to set modified at times.  This allows Desktop<->Cloud syncing to preserve modified at times.
* `crc32` (string): File CRC32 checksum. This is sometimes delayed, so if you get a blank response, wait and try again.
* `md5` (string): File MD5 checksum. This is sometimes delayed, so if you get a blank response, wait and try again.
* `mime_type` (string): MIME Type.  This is determined by the filename extension and is not stored separately internally.
* `region` (string): Region location
* `permissions` (string): A short string representing the current user's permissions.  Can be `r`,`w`,`p`, or any combination
* `subfolders_locked?` (boolean): Are subfolders locked and unable to be modified?
* `download_uri` (string): Link to download file. Provided only in response to a download request.
* `priority_color` (string): Bookmark/priority color of file/folder
* `preview_id` (int64): File preview ID
* `preview`: File preview


---

## List Folders by path

```
Files::Folder.list_for(path, 
  page: 1, 
  per_page: 1, 
  search_all: true, 
  with_priority_color: true
)
```

### Parameters

* `page` (int64): Current page number.
* `per_page` (int64): Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
* `action` (string): Action to take.  Can be `count`, `count_nrs` (non recursive), `size`, `permissions`, or blank.
* `path` (string): Required - Path to operate on.
* `cursor` (string): Send cursor to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor header.
* `filter` (string): If specified, will to filter folders/files list by this string.  Wildcards of `*` and `?` are acceptable here.
* `preview_size` (string): Request a preview size.  Can be `small` (default), `large`, `xlarge`, or `pdf`.
* `search` (string): If `search_all` is `true`, provide the search string here.  Otherwise, this parameter acts like an alias of `filter`.
* `search_all` (boolean): Search entire site?
* `with_priority_color` (boolean): Include file priority color information?


---

## Create folder

```
Files::Folder.create(path)
```

### Parameters

* `path` (string): Required - Path to operate on.
