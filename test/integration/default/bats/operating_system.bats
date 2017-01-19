#!/usr/bin/env bats

@test "OS is Ubuntu" {
  run bash -c "cat /etc/issue | grep Ubuntu | awk '{print $1}'"
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Ubuntu" ]]
}
