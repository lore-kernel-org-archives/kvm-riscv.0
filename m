From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 21 Feb 2024 13:27:49 +1000
Subject: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
Message-ID: <20240221032757.454524-1-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that strange arm64 hang is found to be QEMU bug, I'll repost.
Since arm64 requires Thomas's uart patch and it is worse affected
by the QEMU bug, I will just not build it on arm. The QEMU bug
still affects powerpc (and presumably s390x) but it's not causing
so much trouble for this test case.

I have another test case that can hit it reliably and doesn't
cause crashes but that takes some harness and common lib work so
I'll send that another time.

Since v4:
- Don't build selftest-migration on arm.
- Reduce selftest-migration iterations from 100 to 30 to make the
  test run faster (it's ~0.5s per migration).

Since v3:
- Addressed Thomas's review comments:
- Patch 2 initrd cleanup unset the old variable in the correct place.
- Patch 4 multi migration removed the extra wait for "Now migrate the
  VM" message, and updated comments around it.
- Patch 6 fix typo and whitespace in quiet migration support.
- Patch 8 fix typo and whitespace in migration selftest.

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

 arm/sieve.c                  |   2 +-
 common/selftest-migration.c  |  29 ++++++
 common/sieve.c               |  51 ++++++++++
 lib/migrate.c                |  19 +++-
 lib/migrate.h                |   2 +
 powerpc/Makefile.common      |   1 +
 powerpc/selftest-migration.c |   1 +
 powerpc/unittests.cfg        |   4 +
 riscv/sieve.c                |   2 +-
 s390x/Makefile               |   1 +
 s390x/selftest-migration.c   |   1 +
 s390x/sieve.c                |   2 +-
 s390x/unittests.cfg          |   4 +
 scripts/arch-run.bash        | 177 +++++++++++++++++++++++++----------
 x86/sieve.c                  |  52 +---------
 15 files changed, 240 insertions(+), 108 deletions(-)
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0


