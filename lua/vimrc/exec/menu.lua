-- File:        menu.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     18 Jul 2022
-- SPDX-License-Identifier: MIT

-- Create mouse popup menu
vim.cmd [[
  aunmenu *
  vnoremenu PopUp.Cut                     "+x
  vnoremenu PopUp.Copy                    "+y
  anoremenu PopUp.Paste                   "+gP
  vnoremenu PopUp.Paste                   "+P
  vnoremenu PopUp.Delete                  "_x
  nnoremenu PopUp.Select                  viw
  inoremenu PopUp.Select                  <C-O>viw
  nnoremenu PopUp.Select\ All             ggVG
  vnoremenu PopUp.Select\ All             gg0oG$
  inoremenu PopUp.Select\ All             <C-Home><C-O>VG
]]
