/******************************************************************************
 *  Copyright 2015 by OLTPBenchmark Project                                   *
 *                                                                            *
 *  Licensed under the Apache License, Version 2.0 (the "License");           *
 *  you may not use this file except in compliance with the License.          *
 *  You may obtain a copy of the License at                                   *
 *                                                                            *
 *    http://www.apache.org/licenses/LICENSE-2.0                              *
 *                                                                            *
 *  Unless required by applicable law or agreed to in writing, software       *
 *  distributed under the License is distributed on an "AS IS" BASIS,         *
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *
 *  See the License for the specific language governing permissions and       *
 *  limitations under the License.                                            *
 ******************************************************************************/


package com.oltpbenchmark.benchmarks.seats.procedures;

import java.sql.Connection;
import java.sql.SQLException;

import com.oltpbenchmark.api.Procedure;

public class UpdateCustomer extends Procedure {
    private static native long updateCustomer(long c_id, String c_id_str, long update_ff, long attr0, long attr1);
    
    public void run(Connection conn, Long c_id, String c_id_str, Long update_ff, long attr0, long attr1) throws SQLException {
        long c_id_jni = (c_id == null) ? -1 : c_id;
        long update_ff_jni = (update_ff == null) ? -1 : update_ff;
        
        long ret = this.updateCustomer(c_id_jni, c_id_str, update_ff_jni, attr0, attr1);

        if (ret != 0) {
        	throw new UserAbortException(new String("Error in UpdateCustomer"));
        }
    }
}
