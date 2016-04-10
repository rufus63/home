#!/usr/bin/env python

import logging
import re
import sys

import googlecloudsdk.core.properties as properties

_logger = logging.getLogger(__name__)

def main():
  pf = properties.PropertiesFile.Load()
  print pf.Get(properties.FromString("core/project"))

if __name__ == "__main__":
  logging.basicConfig(stream=sys.stderr, level=logging.WARN)
  main()
