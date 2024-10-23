From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 23 Oct 2024 15:17:19 +0200
Subject: [kvm-unit-tests PATCH 0/2] lib/on-cpus: A couple of fixes
Message-ID: <20241023131718.117452-4-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While creating riscv SBI HSM tests a couple strange on-cpus behaviors
were observed. Fix 'em.

Andrew Jones (2):
  lib/on-cpus: Correct and simplify synchronization
  lib/on-cpus: Fix on_cpumask

 lib/cpumask.h | 14 ++++++++++++++
 lib/on-cpus.c | 53 ++++++++++++++++++---------------------------------
 2 files changed, 33 insertions(+), 34 deletions(-)

-- 
2.47.0


