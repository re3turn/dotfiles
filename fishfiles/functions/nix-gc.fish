function nix-gc --description "Clean up old Nix generations and optimize store"
    echo "Deleting old generations and collecting garbage..."
    nix-collect-garbage -d; or return 1

    echo ""
    echo "Optimizing Nix store..."
    nix store optimise; or return 1

    echo ""
    echo "Done!"
    du -sh /nix/store 2>/dev/null
end
