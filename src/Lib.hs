-- SPDX-License-Identifier: BSD-3-Clause

module Lib (getPutStr) where

import System.Directory (getCurrentDirectory)

getPutStr :: IO String
getPutStr = getCurrentDirectory
