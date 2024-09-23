module Main where

import qualified Amazonka as AWS
import qualified System.IO as IO

main :: IO ()
main = do
    logger <- AWS.newLogger AWS.Debug IO.stdout
    discoveredEnv <- AWS.newEnv AWS.discover
    let env = discoveredEnv { AWS.logger = logger, AWS.region = AWS.London }
    AWS.runResourceT $  AWS.send env 
