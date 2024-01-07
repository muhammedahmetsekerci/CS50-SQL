# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Distributing the data to 3 boats may be good in terms of accessibility and having a backup on other boats in case of a possible boat data loss, but it takes up unnecessary space. Instead, it would be more economical in terms of space if each boat was in its own time zone.

## Partitioning by Hour

If the data is divided into 3 fields according to time periods, each database does not need to take up more space than necessary. It can be more efficient since each database must run on its own time.

## Partitioning by Hash Value

Entering the hash value shortens database running time by searching for small hash values instead of searching for the entire date in possible date searches. We can also make the search faster by using index. However, if all hash values are given, sometimes it may be complicated to give the same hash value to the same date.

