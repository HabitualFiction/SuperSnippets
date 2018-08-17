#step1.sh
cat all-vsd-layouts | gawk '
BEGIN { mb = 1048576 / 512}
/VSD/ { print "VSD " $0 }
/:/{
match ($1, /(0:.*)(0x[0-9a-f]+)-([0-9]+)/, addr);
c = addr[3] / 1048576;
if (c == 1) { print $0 ; } else  {
 for (i = 0; i < c; ++i) { printf "%s0x%x-1048576 %s\n", addr[1], strtonum(addr[2]) + i * mb, $2; }
}}
' > all-vsd-layouts-split


#step2.sh
{ cat all-vsd-layouts-split; \
  echo "PASS2"; \
  cat all-vsd-layouts-split; } | gawk '
function finish() {
if (pass==1) return;
print vsd " would explode " shared " / " c " blocks"
}
BEGIN { pass=1 }
/PASS2/ { print "Pass2 starts at " NR; pass=2 }
/^VSD/ { finish(); vsd=$6; c=0; shared=0; }
/0x/ {
if (pass == 1)
{
        # first pass counts the number of VSDs that reference each address
        match($1, /([^-]+)-/, m);
        ++counts[m[1]];
}
else
{
        # second pass counts how many of each VSD"s blocks are referenced by other VSDs
        match($1, /([^-]+)-/, m);
        ++c;
        if (counts[m[1]] > 1) ++shared;
}
}
END {
finish();
print "Pass2 ends at " NR;
}
' | tee rebalance-impact

addressde
579e577a-b25d-4a3f-9188-6a0c64246532
adedb271-0360-4950-9308-dad9fdd82b78
db11b474-e201-48d8-b821-b22d485418da
2a364b53-9da8-4cd2-8b7b-9b31feb274ce
d2c576c2-4302-43b6-8767-25e7a29baf0b