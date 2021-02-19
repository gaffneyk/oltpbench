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
import java.sql.Timestamp;
import java.sql.SQLException;

import com.oltpbenchmark.api.Procedure;

public class FindFlights extends Procedure {
    private static native long[] findFlights(long depart_aid, long arrive_aid, long start_date, long end_date, long distance);
 
    public long[] run(Connection conn, long depart_aid, long arrive_aid, Timestamp start_date, Timestamp end_date, long distance) throws SQLException {
        long[] ret = this.findFlights(depart_aid, arrive_aid, start_date.getTime(), end_date.getTime(), distance);

        if (ret[0] != 0) {
        	throw new UserAbortException(new String("Error in FindFlights"));
        }

        long[] flights = new long[ret.length - 1];
        for (int i = 1; i < ret.length; i++) {
        	flights[i - 1] = ret[i];
        }

        return flights;
    }
}
