#!/usr/bin/env bash
nohup java -jar ~/trainingcode/target/train-back-1.0.1-SNAPSHOT.war  > ~/trainingcode/trainingcode.txt 2>&1 &
echo $! > ~/trainingcode/pid.file
