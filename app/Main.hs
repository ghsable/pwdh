-- SPDX-License-Identifier: BSD-3-Clause

module Main where

import qualified Lib (getPutStr, getOption)

main :: IO ()
main = putStrLn =<< Lib.getPutStr
                =<< Lib.getOption
