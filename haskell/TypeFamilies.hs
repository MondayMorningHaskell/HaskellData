{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module TypeFamilies where

import Control.Monad.Trans (lift)
import Control.Monad.Trans.Reader
import Control.Monad.Trans.State
import qualified Data.Map as M
import Data.Time
import System.IO

class (Monad m) => MyLoggerMonad m where
  type LogState m :: *
  retrieveState :: m (LogState m)
  logString :: String -> m ()

newtype ListWrapper a = ListWrapper (State [String] a)
  deriving (Functor, Applicative, Monad)

instance MyLoggerMonad ListWrapper where
  type LogState ListWrapper = [String]
  retrieveState = ListWrapper get
  logString msg = ListWrapper $ do
    prev <- get
    put (msg : prev)

listWrapper :: [String]
listWrapper = runListWrapper produceStringsList

runListWrapper :: ListWrapper a -> a
runListWrapper (ListWrapper action) = evalState action []

produceStringsList :: ListWrapper [String]
produceStringsList = do
  logString "Hello"
  logString "World"
  retrieveState

type TimeMsgMap = M.Map UTCTime String
newtype StampedMessages a = StampedMessages (StateT TimeMsgMap IO a)
  deriving (Functor, Applicative, Monad)

instance MyLoggerMonad StampedMessages where
  type LogState StampedMessages = TimeMsgMap
  retrieveState = StampedMessages get
  logString msg = StampedMessages $ do
    ts <- lift getCurrentTime
    lift (print ts)
    prev <- get
    put (M.insert ts msg prev)

stampWrapper :: IO [String]
stampWrapper = M.elems <$> (runStampWrapper produceStringsMap)

runStampWrapper :: StampedMessages a -> IO a
runStampWrapper (StampedMessages action) = evalStateT action M.empty

produceStringsMap :: StampedMessages TimeMsgMap
produceStringsMap = do
  logString "Hello"
  logString "World"
  retrieveState

newtype FileLogger a = FileLogger (ReaderT FilePath IO a)
  deriving (Functor, Applicative, Monad)

instance MyLoggerMonad FileLogger where
  type LogState FileLogger = [String]
  retrieveState = FileLogger $ do
    fp <- ask
    (reverse . lines) <$> lift (readFile fp)
  logString msg = FileLogger $ do
    lift (putStrLn msg)
    fp <- ask
    lift (appendFile fp (msg ++ "\n"))

fileLogger :: IO [String]
fileLogger = runFileLogger produceFileLogs "logs.txt"

runFileLogger :: FileLogger a -> FilePath -> IO a
runFileLogger (FileLogger action) fp = do
  h <- openFile fp WriteMode
  hClose h
  runReaderT action fp

produceFileLogs :: FileLogger [String]
produceFileLogs = do
  logString "Hello"
  logString "World"
  retrieveState

useAnyLogger :: (MyLoggerMonad m) => m (LogState m)
useAnyLogger = do
  logString "Hello" 
  logString "World" 
  logString "!"
  retrieveState

runListGeneric :: [String]
runListGeneric = runListWrapper useAnyLogger

runStampGeneric :: IO TimeMsgMap
runStampGeneric = runStampWrapper useAnyLogger

runFileGeneric :: IO [String]
runFileGeneric = runFileLogger useAnyLogger "logs.txt"
