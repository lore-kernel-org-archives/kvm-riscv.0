From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  3 Sep 2024 16:39:47 +0200
Subject: [kvm-unit-tests PATCH 0/2] configure: Support CONFIG_* extension
Message-ID: <20240903143946.834864-4-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

riscv already wants to change NR_CPUS sometimes, so a CONFIG_NR_CPUS,
which can be changed at compile time, would be helpful. We could just
provide support for that with the configure command line, but other
configurations will eventually come along (there are already two more
in another riscv branch). Add support for extending config.h with a
manually provided config.h-type file and also add support for using it
for CONFIG_NR_CPUS for riscv.

Andrew Jones (2):
  configure: Introduce add-config
  riscv: Make NR_CPUS configurable

 configure             | 17 ++++++++++++++++-
 lib/riscv/asm/setup.h |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.46.0


