From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 31 Oct 2024 13:39:49 +0100
Subject: [kvm-unit-tests PATCH v2 0/3] lib/on-cpus: A couple of fixes
Message-ID: <20241031123948.320652-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While creating riscv SBI HSM tests a couple strange on-cpus behaviors
were observed. Fix 'em.

v2:
 - Added patch for barrier after func() [Alex]
 - Improved commit message for patch1 [Alex]

Andrew Jones (3):
  lib/on-cpus: Correct and simplify synchronization
  lib/on-cpus: Add barrier after func call
  lib/on-cpus: Fix on_cpumask

 lib/cpumask.h | 14 +++++++++++++
 lib/on-cpus.c | 56 ++++++++++++++++++++-------------------------------
 2 files changed, 36 insertions(+), 34 deletions(-)

-- 
2.47.0


