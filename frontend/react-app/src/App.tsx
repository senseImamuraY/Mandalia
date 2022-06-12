import React, { useState, useEffect, createContext } from "react"
import logo from './logo.svg';
import './App.css';

import { BrowserRouter, Routes, Route, useParams, Link, Navigate } from "react-router-dom";

import { Users } from "./containers/User";
import { MainTargets } from "./containers/MainTarget";
import { SubTargets } from "./containers/SubTarget";
import PrimaryButton from './components/atoms/button/PrimaryButton';
import SecondaryButton from './components/atoms/button/SecondaryButton';

import CommonLayout from "components/layouts/CommonLayout"
import Home from "components/pages/Home"
import SignUp from "components/pages/SignUp"
import SignIn from "components/pages/SignIn"

import { getCurrentUser } from "lib/api/auth"
import { User } from "interfaces/index"

export const AuthContext = createContext({} as {
  loading: boolean
  setLoading: React.Dispatch<React.SetStateAction<boolean>>
  isSignedIn: boolean
  setIsSignedIn: React.Dispatch<React.SetStateAction<boolean>>
  currentUser: User | undefined
  setCurrentUser: React.Dispatch<React.SetStateAction<User | undefined>>
})

const App: React.FC = () => {
  const { userId } = useParams();

  const [loading, setLoading] = useState<boolean>(true)
  const [isSignedIn, setIsSignedIn] = useState<boolean>(false)
  const [currentUser, setCurrentUser] = useState<User | undefined>()

  // 認証済みのユーザーがいるかどうかチェック
  // 確認できた場合はそのユーザーの情報を取得
  const handleGetCurrentUser = async () => {
    try {
      const res = await getCurrentUser()
      console.log(res)
      console.log(res?.data.isLogin)
      if (res?.data.isLogin === true) {
        setIsSignedIn(true)
        setCurrentUser(res?.data.data)

        console.log(res?.data.data)
        console.log("Yes current user")
      } else {
        console.log("No current user")
      }
    } catch (err) {
      console.log(err)
    }

    setLoading(false)
  }

  useEffect(() => {
    handleGetCurrentUser()
  }, [setCurrentUser])
  // }, [setCurrentUser])


  // ユーザーが認証済みかどうかでルーティングを決定
  // 未認証だった場合は「/signin」ページに促す
  const PrivateRoute = ({ children }: { children: React.ReactElement }) => {
    if (!loading) {
      console.log(loading)
      console.log(isSignedIn)
      if (isSignedIn) {
        return (
          <>
            {children}
          <p>ようこそMandaliaへ</p>
          </>
          
        )
      } else {
        console.log(isSignedIn)
        return (
          <>
            <Navigate to="/signin" />
            
          </>
        
        )

      }
    } else {
      return <></>
    }
  }


  return (
    <>
    <PrimaryButton>logM=B</PrimaryButton>
    <SecondaryButton>logM=B</SecondaryButton>
      <BrowserRouter>
        <AuthContext.Provider value={{ loading, setLoading, isSignedIn, setIsSignedIn, currentUser, setCurrentUser}}>
          <Link to="users/:usersId">aaa</Link>
            <CommonLayout>
              <Routes>
                {/* <Route path="/" element={<Home />}/> */}
                <Route path="users/:usersId" element={<Users />} />
                <Route path="main_targets" element={<MainTargets />}/>
                <Route path="sub_targets" element={<SubTargets />}/>
                <Route path="/signup" element={<SignUp />} />
                <Route path="/signin" element={<SignIn />} />
                {/* <PrivateRoute>
                  <Route path="/" element={<Home />} />
                </PrivateRoute> */}
                <Route
                  path="/"
                  element={
                  <PrivateRoute>
                    <Home />
                  </PrivateRoute>
                  }
                />
              </Routes>
            </CommonLayout>
          </AuthContext.Provider>
      </BrowserRouter>
    </>
  );
}

export default App;
