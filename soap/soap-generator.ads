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

--  $Id$

with Ada.Strings.Unbounded;

with SOAP.WSDL.Parser;
with SOAP.WSDL.Parameters;

package SOAP.Generator is

   Version : constant String := "0.9";

   Generator_Error : exception;

   type Object is new SOAP.WSDL.Parser.Object with private;

   procedure Start_Service
     (O             : in out Object;
      Name          : in     String;
      Documentation : in     String;
      Location      : in     String);
   --  Called for every service in the WSDL document

   procedure End_Service
     (O    : in out Object;
      Name : in     String);
   --  Called at the end of the service

   procedure New_Procedure
     (O          : in out Object;
      Proc       : in     String;
      SOAPAction : in     String;
      Namespace  : in     String;
      Input      : in     WSDL.Parameters.P_Set;
      Output     : in     WSDL.Parameters.P_Set;
      Fault      : in     WSDL.Parameters.P_Set);
   --  Called for each SOAP procedure found in the WSDL document for the
   --  current service.

   --------------
   -- Settings --
   --------------

   procedure Quiet     (O : in out Object);
   --  Set quiet mode (default off)

   procedure No_Stub   (O : in out Object);
   --  Do not generate stub (stub generated by default)

   procedure No_Skel   (O : in out Object);
   --  Do not generate skeleton (skeleton generated by default)

   procedure Ada_Style (O : in out Object);
   --  Use Ada style identifier, by default the WSDL casing is used

   procedure CVS_Tag (O : in out Object);
   --  Add CVS tag Id in the unit header (no CVS by default)

   procedure WSDL_File (O : in out Object; Filename : in String);
   --  Add WSDL file in parent file comments (no WSDL by default)

   procedure Overwrite (O : in out Object);
   --  Add WSDL file in parent file comments (no overwritting by default)

   procedure Set_Proxy (O : in out Object; Proxy, User, Password : in String);
   --  Set proxy user and password, needed if behind a firewall with
   --  authentication.

private

   use Ada.Strings.Unbounded;

   type Object is new SOAP.WSDL.Parser.Object with record
      Quiet     : Boolean := False;
      Gen_Stub  : Boolean := True;
      Gen_Skel  : Boolean := True;
      Ada_Style : Boolean := False;
      CVS_Tag   : Boolean := False;
      Force     : Boolean := False;
      Location  : Unbounded_String;
      WSDL_File : Unbounded_String;
      Proxy     : Unbounded_String;
      P_User    : Unbounded_String;
      P_Pwd     : Unbounded_String;
   end record;

end SOAP.Generator;
