------------------------------------------------------------------------------
--                              Ada Web Server                              --
--                                                                          --
--                            Copyright (C) 2003                            --
--                                ACT-Europe                                --
--                                                                          --
--  Authors: Dmitriy Anisimkov - Pascal Obry                                --
--                                                                          --
--  This library is free software; you can redistribute it and/or modify    --
--  it under the terms of the GNU General Public License as published by    --
--  the Free Software Foundation; either version 2 of the License, or (at   --
--  your option) any later version.                                         --
--                                                                          --
--  This library is distributed in the hope that it will be useful, but     --
--  WITHOUT ANY WARRANTY; without even the implied warranty of              --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       --
--  General Public License for more details.                                --
--                                                                          --
--  You should have received a copy of the GNU General Public License       --
--  along with this library; if not, write to the Free Software Foundation, --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          --
--                                                                          --
--  As a special exception, if other files instantiate generics from this   --
--  unit, or you link this unit with other files to produce an executable,  --
--  this  unit  does not  by itself cause  the resulting executable to be   --
--  covered by the GNU General Public License. This exception does not      --
--  however invalidate any other reasons why the executable file  might be  --
--  covered by the  GNU Public License.                                     --
------------------------------------------------------------------------------
--  Deflate on Append to the memory stream.                                 --
------------------------------------------------------------------------------

--  $RCSfile$
--  $Revision$
--  $Date$
--  $Author$

package AWS.Resources.Streams.Memory.ZLib.Deflate is

   type Stream_Type is new ZLib.Stream_Type with private;

   subtype Compression_Level  is ZL.Compression_Level;
   subtype Strategy_Type      is ZL.Strategy_Type;
   subtype Compression_Method is ZL.Compression_Method;
   subtype Memory_Level_Type  is ZL.Memory_Level_Type;

   procedure Init
     (Resource     : in out Stream_Type;
      Level        : in     Compression_Level  := ZL.Default_Compression;
      Strategy     : in     Strategy_Type      := ZL.Default_Strategy;
      Method       : in     Compression_Method := ZL.Deflated;
      Window_Bits  : in     Window_Bits_Type   := ZL.Default_Window_Bits;
      Memory_Level : in     Memory_Level_Type  := ZL.Default_Memory_Level;
      Header       : in     Header_Type        := ZL.Default);
   --  Initialize

private

   type Stream_Type is new ZLib.Stream_Type with null record;

end AWS.Resources.Streams.Memory.ZLib.Deflate;
