-- SPDX-License-Identifier: BSD-3-Clause

module Main where

import qualified Lib (getPutStr, getOption, getArgs')

main :: IO ()
main = putStrLn =<< Lib.getPutStr
                =<< Lib.getOption
                =<< Lib.getArgs'
