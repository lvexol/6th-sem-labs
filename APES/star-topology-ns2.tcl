# Create a new NS2 simulator instance
set ns [new Simulator]

# Define trace files
set tracefile [open star_topology.tr w]
$ns trace-all $tracefile

set namfile [open star_topology.nam w]
$ns namtrace-all $namfile

# Create a network topology (star with one central node)
set hub [$ns node]

# Number of client nodes
set num_nodes 5

# Array to store client nodes
set nodes {}

# Create client nodes and link to hub
for {set i 0} {$i < $num_nodes} {incr i} {
    set node($i) [$ns node]
    $ns duplex-link $node($i) $hub 1Mb 10ms DropTail
}

# Setup TCP connections (each client to hub)
for {set i 0} {$i < $num_nodes} {incr i} {
    # Create TCP Agent
    set tcp($i) [new Agent/TCP]
    $ns attach-agent $node($i) $tcp($i)

    # Create TCP Sink
    set sink($i) [new Agent/TCPSink]
    $ns attach-agent $hub $sink($i)

    # Establish TCP connection
    $ns connect $tcp($i) $sink($i)

    # Attach a traffic source (FTP)
    set ftp($i) [new Application/FTP]
    $ftp($i) attach-agent $tcp($i)
    $ftp($i) set type_ FTP
}

# Run simulation
$ns at 0.1 "puts \"Simulation Started\""
$ns at 0.2 "foreach f $ftp { $f start }"
$ns at 5.0 "foreach f $ftp { $f stop }"
$ns at 6.0 "puts \"Simulation Finished\""
$ns at 6.1 "finish"

# Finish Procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam star_topology.nam &
    exit 0
}

# Run the simulation
$ns run
