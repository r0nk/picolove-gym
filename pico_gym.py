#!/bin/env python3

import random
import pyTGA
import numpy as np

import gym
from gym import spaces

import os
import time

picopath="/home/r0nk/.local/share/love/picolove/"

print("Starting up picogym")

def wtf(file,string):
    with open(picopath+file,"w") as f:
        f.write(string)
        f.close()

def wait_for_contents(file,string):
    while True:
        with open(picopath+file,"r") as f:
            if f.read() == string:
                    break
            f.close()

class Picogym(gym.Env):
    """Example of a custom env in which you have to walk down a corridor.
    You can configure the length of the corridor via the env config."""

    def __init__(self):
        self.action_space = spaces.Discrete(7) #nothing, up, down, left, right, a, b
        self.observation_space = spaces.Box(low=0,high=255,shape=(128,128,3),dtype=np.uint8)
        os.system("love . &")
        time.sleep(1)

    def observe(self):
        image = pyTGA.Image()
        a = []
        i=0
        while os.stat(picopath+"screen.tga").st_size < 8:
            pass
        for p in image.load(picopath+"screen.tga").get_pixels():
            i+=1
            if i % 4 == 0:
                continue
            a.append(p)
        return np.array(a).reshape((128,128,3))

    def reset(self):
        self.cur_pos = 0
        return self.observe()

    def step(self, action):
        wait_for_contents("step","0")
        action_string = ""
        for i in range(5):
            if i == action:
                action_string+="1"
            else:
                action_string+="0"
        wtf("action",str(action_string))
        obs = self.observe()
        wtf("step","1")
        done = False
        return obs, False, {}

    def seed(self, seed=None):
        random.seed(seed)
