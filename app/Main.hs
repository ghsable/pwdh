-- SPDX-License-Identifier: BSD-3-Clause

module Main where

import System.Directory (getCurrentDirectory)

main :: IO ()
main = putStrLn =<< getCurrentDirectory
