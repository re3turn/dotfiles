function set_u_var -d "set universal variable"
    if test (count $argv) -ne 2
        echo "Usage: set_u_var <variable-name> <set-path>"
        return 1
    end
    if not contains $argv[2] $$argv[1]
        set -U $argv[1] $argv[2] $$argv[1]
    end
end
