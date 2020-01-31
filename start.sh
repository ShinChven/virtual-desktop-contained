#!/bin/sh
$*
keep_alive(){
while true; do
    sleep 1000
done
}
keep_alive
