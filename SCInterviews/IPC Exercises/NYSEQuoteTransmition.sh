#!/bin/bash

echo starting server feed handler
~/q/m32/q fakeFH.q &
echo ending server feed handler
sleep 3
echo staring receiver feed handler
~/q/m32/q receiver.q &
echo ending receiver feed handler
