#!/bin/bash
#
#   Copyright 2012 Timothy Lebo
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#
#
# Usage:
#   export CLASSPATH=$CLASSPATH`$CSV2RDF4LOD_HOME/bin/util/cr-situate-classpaths.sh`
#   (can be repeated indefinately, once paths are in PATH, nothing is returned.)

missing=""

# Java dependencies; relative to $CSV2RDF4LOD_HOME
for jar in                                                             \
           lib/javacsv2.0/javacsv.jar                                  \
           bin/dup/openrdf-sesame-2.3.1-onejar.jar                     \
           bin/dup/slf4j-api-1.5.6.jar                                 \
           bin/dup/slf4j-nop-1.5.6.jar                                 \
           lib/joda-time-2.0/joda-time-2.0.jar                         \
           bin/dup/datadigest-1.0-SNAPSHOT.jar                         \
           bin/lib/commons-validator-1.3.1/commons-validator-1.3.1.jar \
           bin/dup/csv2rdf4lod.jar ; do
   if [[ $CLASSPATH != *`basename $jar`* ]]; then
      if [ ${CSV2RDF4LOD_CONVERT_DEBUG_LEVEL:="."} == "fine" ]; then
         echo "`basename $jar` not in classpath; adding $CSV2RDF4LOD_HOME/$jar"
      fi
      missing=$missing:$CSV2RDF4LOD_HOME/$jar # TODO: export? : vs ; cygwin
   fi
done

echo $missing
