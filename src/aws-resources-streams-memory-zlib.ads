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

--  $RCSfile$
--  $Revision$
--  $Date$
--  $Author$

with ZLib;

package AWS.Resources.Streams.Memory.ZLib is

   package ZL renames Standard.ZLib;

   type Stream_Type is new Memory.Stream_Type with private;

   subtype Window_Bits_Type is ZL.Window_Bits_Type;
   subtype Header_Type      is ZL.Header_Type;

   procedure Append
     (Resource : in out Stream_Type;
      Buffer   : in     Stream_Element_Array);
   --  Compress and Append Buffer into the memory stream

   procedure Append
     (Resource : in out Stream_Type;
      Buffer   : in     Stream_Element_Access);
   --  Compress and Append Buffer into the memory stream

   procedure Flush (Resource : in out Stream_Type'Class);
   --  Complete compression, flush internal compression buffer to the
   --  memory stream.

private

   type Stream_Type is new Memory.Stream_Type with record
      Filter : ZL.Filter_Type;
   end record;

end AWS.Resources.Streams.Memory.ZLib;
