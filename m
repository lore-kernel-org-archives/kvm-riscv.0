From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 12:12:22 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: Improve on-cpu and IPI support
Message-ID: <20240830101221.2202707-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first two patches improve general library support for cpumasks and
the on-cpus API. on-cpus can now take cpumasks for input. The last patch
improves support for sending IPIs on riscv using the SBI IPI extension
by supporting a nicer interface of cpuids and cpumasks.

Andrew Jones (3):
  lib/cpumask: Fix and simplify a few functions
  lib/on-cpus: Introduce on_cpumask and on_cpumask_async
  riscv: Introduce SBI IPI convenience functions

 lib/cpumask.h       | 47 +++++++++++++++++----------------------------
 lib/on-cpus.c       | 35 +++++++++++++++++++++++++--------
 lib/on-cpus.h       |  3 +++
 lib/riscv/asm/sbi.h |  3 +++
 lib/riscv/sbi.c     | 43 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+), 37 deletions(-)

-- 
2.45.2


