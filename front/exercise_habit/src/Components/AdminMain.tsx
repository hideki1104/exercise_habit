import React, { useState, useEffect } from 'react';
import { BrowserRouter, Switch, Route, Redirect } from 'react-router-dom';
import { Header } from './Header';
import { Footer } from './Footer';
import { AdminLogin } from './Auth/AdminLogin';

interface AdminMainProps {

}

export const AdminMain: React.FC<AdminMainProps> = () => {
  const [isLogin, setIsLogin] = useState(false);

  useEffect(() => {
    if (localStorage.getItem("headers") != null) {
      setIsLogin(true)
    }
  })

  type ResponseHeader = {
    'access-token': string
    'cache-control': string
    'client': string
    'content-type': string
    'uid': string
  }

  const handleLogin = (userName: string, responseHeader:ResponseHeader):void => {
    localStorage.setItem("headers", JSON.stringify(responseHeader));
    localStorage.setItem("userName", userName);
    setIsLogin(true);
  }

  const handleLogout = () => {
    localStorage.clear();
    setIsLogin(false);
  }

  return(
    <>
      <BrowserRouter>
        <Header isAdmin={true} isLogin={isLogin} handleLogout={handleLogout}/>
        <Switch>
          <Route
            exact path={"/admin/sign_in"}
            render={props => (
              <AdminLogin handleLogin={handleLogin}/>
            )}
          />
        </Switch>
        <Footer/>
      </BrowserRouter>
    </>
  );
}