#!/bin/bash
#backup user files
tar -zcf /home/devops/back_$(date "+%d%m%Y").tar.gz /home/toorr2p
