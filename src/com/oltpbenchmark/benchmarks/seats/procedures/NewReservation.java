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

public class NewReservation extends Procedure {
    private static native long newReservation(long r_id, long c_id, long f_id, long seatnum, double price, long attrs[]);
    
    public void run(Connection conn, long r_id, long c_id, long f_id, long seatnum, double price, long attrs[]) throws SQLException {
        long ret = this.newReservation(r_id, c_id, f_id, seatnum, price, attrs);

        if (ret != 0) {
        	throw new UserAbortException(new String("Error in NewReservation"));
        }
    }
}
