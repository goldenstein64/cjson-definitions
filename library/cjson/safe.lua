---@meta

---@class cjson.safe : cjson
local cjson_safe = {}

---`cjson.decode` will deserialise any UTF-8 JSON string into a Lua value or
---table.
---
---UTF-16 and UTF-32 JSON strings are not supported.
---
---`cjson.decode` requires that any NULL (ASCII 0) and double quote (ASCII 34)
---characters are escaped within strings. All escape codes will be decoded and
---other bytes will be passed transparently. UTF-8 characters are not validated
---during decoding and should be checked elsewhere if required.
---
---JSON `null` will be converted to NULL `lightuserdata` value. This can be
---compared with `cjson.null` for convenience.
---
---By default, numbres incompatible with the JSON specification (infinity,
---NaN, hexadecimal) can be decoded. This default can be changed with
---`cjson.decode_invalid_numbers`.
---
---**Example: Decoding**
---
---```lua
---json_text = '[ true, { "foo": "bar" } ]'
---value = cjson.decode(json_text)
----- Returns: { true, { foo = "bar" } }
---```
---
---> **Caution**
--->
---> Care must be taken after decoding JSON objects with numeric keys. Each
---> numeric key will be stored as a Lua `string`. Any subsequent code assuming
---> type `number` may break.
---@param json_text string
---@return any? value, string? error_message
function cjson_safe.decode(json_text) end

---`cjson.encode` will serialise a Lua value into a string containing the JSON
---representation.
---
---`cjson.encode` supports the following types:
---
---- `boolean`
---- `lightuserdata` (NULL value only)
---- `nil`
---- `number`
---- `string`
---- `table`
---
---The remaining Lua types will generate an error:
---
---- `function`
---- `lightuserdata` (non-NULL values)
---- `thread`
---- `userdata`
---
---By default, numbers are encoded with 14 significant digits. Refer to
---`cjson.encode_number_precision` for details.
---
---Lua CJSON will escape the following characters within each UTF-8 string:
---
---- Control characters (ASCII 0 - 31)
---- Double quote (ASCII 34)
---- Forward slash (ASCII 47)
---- Backslash (ASCII 92)
---- Delete (ASCII 127)
---
---All other bytes are passed transparently.
---
---> **Caution**
--->
---> Lua CJSON will successfully encode/decode binary strings, but this is
---> technically not supported by JSON and may not be compatible with other
---> JSON libraries. To ensure the output is valid JSON, applications should
---> ensure all Lua strings passed to `cjson.encode` are UTF-8.
--->
---> Base64 is commonly used to encode binary data as the most efficient
---> encoding under UTF-8 can only reduce the encoded size by a further ~8%.
---> Lua Base64 routines can be found in the
---> [LuaSocket](http://w3.impa.br/%7Ediego/software/luasocket/) and
---> [lbase64](http://www.tecgraf.puc-rio.br/%7Elhf/ftp/lua/#lbase64) packages.
---
---Lua CJSON uses a heuristic to determine whether to encode a Lua table as a
---JSON array or an object. A Lua table with only positive integer keys of type
---`number` will be encoded as a JSON array. All other tables will be encoded
---as a JSON object.
---
---Lua CJSON does not use metamethods when serialising tables.
---
---- `rawget` is used to iterate over Lua arrays
---- `next` is used to iterate over Lua objects
---
---Lua arrays with missing entries (*sparse arrays*) may optionally be encoded
---in several different ways. Refer to `cjson.encode_sparse_array` for details.
---
---JSON object keys are always strings. Hence `cjson.encode` only supports
---table keys which are type `number` or `string`. All other types will
---generate an error.
---
---> **Note**
--->
---> Standards compliant JSON must be encapsulated in either an object (`{}`)
---> or an array (`[]`). If strictly standards compliant JSON is desired, a
---> table must be passed to `cjson.encode`.
---
---By default, encoding the following Lua values will generate errors:
---
---- Numbers incompatible with the JSON specification (infinity, NaN)
---- Tables nested more than 1000 levels deep
---- Excessively sparse Lua arrays
---
---These defaults can be changed with:
---
---- `cjson.encode_invalid_numbers`
---- `cjson.encode_max_depth`
---- `cjson.encode_sparse_array`
---
---**Example: Encoding**
---
---```lua
---value = { true, { foo = "bar" } }
---json_text = cjson.encode(value)
----- Returns: '[true,{"foo":"bar"}]'
---```
---@param value unknown
---@return string? json_text, string? error_message
function cjson_safe.encode(value) end


return cjson_safe
