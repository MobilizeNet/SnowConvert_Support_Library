﻿-- <copyright file="HEX_UDF.cs" company="Mobilize.Net">
--        Copyright (C) Mobilize.Net info@mobilize.net - All Rights Reserved
-- 
--        This file is part of the Mobilize Frameworks, which is
--        proprietary and confidential.
-- 
--        NOTICE:  All information contained herein is, and remains
--        the property of Mobilize.Net Corporation.
--        The intellectual and technical concepts contained herein are
--        proprietary to Mobilize.Net Corporation and may be covered
--        by U.S. Patents, and are protected by trade secret or copyright law.
--        Dissemination of this information or reproduction of this material
--        is strictly forbidden unless prior written permission is obtained
--        from Mobilize.Net Corporation.
-- </copyright>

-- =============================================
-- Description: UDF for Teradata CHAR2HEXINT function
-- =============================================
CREATE OR REPLACE FUNCTION PUBLIC.CHAR2HEXINT_UDF (IN_STR VARCHAR)
  RETURNS VARCHAR
  LANGUAGE JAVASCRIPT
AS $$
  return IN_STR.split('').map( e => "00" + e.charCodeAt(0).toString(16) ).join('');
$$
;