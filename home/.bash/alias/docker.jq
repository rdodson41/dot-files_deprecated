to_entries[] |
{ key, value, name: .key | gsub("-"; "") } |
(
  "alias \"\(.key)-ps\"=\"docker ps --filter \\\"name=\(.name)\\\"\"",
  (
    { key, value: .value[], name } |
    (
      "alias \"\(.key)-\(.value)-ps\"=\"docker ps --filter \\\"name=\(.name)-\(.value)\\\"\"",
      "alias \"\(.key)-\(.value)\"=\"docker ps --filter \\\"name=\(.name)-\(.value)\\\" --quiet | xargs docker\"",
      "alias \"\(.key)-\(.value)-first\"=\"docker ps --filter \\\"name=\(.name)-\(.value)\\\" --quiet | first | xargs docker\"",
      "alias \"\(.key)-\(.value)-first-exec\"=\"docker exec --interactive --tty \\\"\\$(docker ps --filter \\\"name=\(.name)-\(.value)\\\" --quiet | first)\\\"\""
    )
  )
)
