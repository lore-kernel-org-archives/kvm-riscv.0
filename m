From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  9 Feb 2024 17:01:33 +1000
Subject: [kvm-unit-tests PATCH v3 0/8] Multi-migration support
Message-ID: <20240209070141.421569-1-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since v2:
- Rebase on riscv port and auxvinfo fix was merged.
- Clean up initrd cleanup moves more commands into the new cleanup
  function from the trap handler comands (suggested by Thomas).
- "arch-run: Clean up temporary files properly" patch is now renamed
  to "arch-run: Fix TRAP handler..."
- Fix TRAP handler patch has redone changelog to be more precise about
  the problem and including recipe to recreate it.
- Fix TRAP handler patch reworked slightly to remove the theoretical
  race rather than just adding a comment about it.
- Patch 3 was missing a couple of fixes that leaked into patch 4,
  those are moved into patch 3.

I did look into doing a better job at handling timeouts in places
where the migration script can hang (the timeout command only kills
the qemu process, but there are other places the bash script itself
can still timeout). There are ways it might be possible (along the
lines of starting ( sleep N ; kill ) subshell in the backround), but
it's very tricky to handle all the details. Existing script has
timeout issues already, so this series doesn't add a fundamentally
new type of problem here.

Thanks,
Nick

Nicholas Piggin (8):
  arch-run: Fix TRAP handler recursion to remove temporary files
    properly
  arch-run: Clean up initrd cleanup
  migration: use a more robust way to wait for background job
  migration: Support multiple migrations
  arch-run: rename migration variables
  migration: Add quiet migration support
  Add common/ directory for architecture-independent tests
  migration: add a migration selftest

 arm/Makefile.common          |   1 +
 arm/selftest-migration.c     |   1 +
 arm/sieve.c                  |   2 +-
 arm/unittests.cfg            |   6 ++
 common/selftest-migration.c  |  34 +++++++
 common/sieve.c               |  51 ++++++++++
 lib/migrate.c                |  20 +++-
 lib/migrate.h                |   2 +
 powerpc/Makefile.common      |   1 +
 powerpc/selftest-migration.c |   1 +
 powerpc/unittests.cfg        |   4 +
 riscv/sieve.c                |   2 +-
 s390x/Makefile               |   1 +
 s390x/selftest-migration.c   |   1 +
 s390x/sieve.c                |   2 +-
 s390x/unittests.cfg          |   4 +
 scripts/arch-run.bash        | 182 ++++++++++++++++++++++++++---------
 x86/sieve.c                  |  52 +---------
 18 files changed, 261 insertions(+), 106 deletions(-)
 create mode 120000 arm/selftest-migration.c
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0


