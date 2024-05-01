From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed,  1 May 2024 21:29:29 +1000
Subject: [kvm-unit-tests PATCH v3 0/5] add shellcheck support
Message-ID: <20240501112938.931452-1-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is based on upstream directly now, not ahead of the powerpc
series.

Since v2:
- Rebased to upstream with some patches merged.
- Just a few comment typos and small issues (e.g., quoting
  `make shellcheck` in docs) that people picked up from the
  last round.

`make shellcheck` passes with no warnings for me after this series.
(You should be able to put patch 1 at the end without conflicts if
you prefer to only introduce the shellcheck Makefile target when the
tree is clean.)

Thanks,
Nick

Nicholas Piggin (5):
  Add initial shellcheck checking
  shellcheck: Fix SC2155
  shellcheck: Fix SC2124
  shellcheck: Fix SC2294
  shellcheck: Suppress various messages

 .shellcheckrc           | 30 ++++++++++++++++++++++++++++++
 Makefile                |  4 ++++
 README.md               |  3 +++
 configure               |  2 ++
 run_tests.sh            |  3 +++
 scripts/arch-run.bash   | 33 ++++++++++++++++++++++++++-------
 scripts/common.bash     |  5 ++++-
 scripts/mkstandalone.sh |  2 ++
 scripts/runtime.bash    |  6 +++++-
 9 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 .shellcheckrc

-- 
2.43.0


