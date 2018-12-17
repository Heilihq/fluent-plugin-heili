# fluent-plugin-heili
This plugin is used by Heili to parse incoming metrics and store in data source.  

## Input
Heili Input plugin is based on [fluent-plugin-amqp](https://raw.githubusercontent.com/giraffi/fluent-plugin-amqp) with two modifications:
 - Manual acknowledge messages
 - Incoming messages are parsed as event stream and not single event
Heili messages can be single or multiple Jsons separated by `\n`
```
{"foo":"bar"}
{"bar":"foo"}\n
{"foo":"bar"}\n{"bar":"foo"}
```

## Parser
Heili Parser is responsible for parsing special occasions with the data:
 - Convert to string integer that is not suiting Bignum size of `msgpack`.  
 Fix error: ``RangeError: bignum too big to convert into ` long long'``.  
  More information:
    - [msgpack spec](https://github.com/msgpack/msgpack/blob/master/spec.md#int-format-family)
    - [telegraf elasticsearch known issues](https://github.com/influxdata/telegraf/blob/master/plugins/outputs/elasticsearch/README.md#known-issues)
    - [msgpack biginteger support issue](https://github.com/msgpack/msgpack/issues/206)
