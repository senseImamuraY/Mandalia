import React from 'react';
import logo from './logo.svg';
import './App.css';

import { BrowserRouter, Routes, Route, useParams } from "react-router-dom";

import { Users } from "./containers/User";
import { MainTargets } from "./containers/MainTarget";
import { SubTargets } from "./containers/SubTarget";


function App() {
  // const { params } = useParams();
  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="users/:usersId" element={<Users />} />
          <Route path="main_targets" element={<MainTargets />}/>
          <Route path="sub_targets" element={<SubTargets />}/>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
