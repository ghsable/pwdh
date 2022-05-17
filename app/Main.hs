-- SPDX-License-Identifier: MIT

module Main where

import System.Directory (getCurrentDirectory)

main :: IO ()
main = putStrLn =<< getCurrentDirectory
