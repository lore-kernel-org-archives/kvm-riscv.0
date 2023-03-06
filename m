From: David Matlack <dmatlack@google.com>
Date: Mon,  6 Mar 2023 11:01:52 -0800
Subject: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom stat names
Message-ID: <20230306190156.434452-1-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series refactors the KVM stats macros to reduce duplication and
adds the support for choosing custom names for stats.

Custom name makes it possible to decouple the userspace-visible stat
names from their internal representation in C. This can allow future
commits to refactor the various stats structs without impacting
userspace tools that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. Case in point, the last
patch in this series removes the pages_{4k,2m,1g} union, which is a
useful cleanup to prepare for sharing paging code across architectures
[1].

And for full transparency, another motivation for this series it that at
Google we have several out-of-tree stats that use arrays. Custom name
support is something we added internally and it reduces our technical
debt to get the support merged upstream.

Tested on x86. Compile tested on ARM. Not yet tested on any other
architectures.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack at google.com/

v2:
 - Refactor stat macros (patch 1) to reduce duplication and make it
   simpler to add custom name support [Sean]

v1: https://lore.kernel.org/kvm/20230118175300.790835-1-dmatlack at google.com/

David Matlack (4):
  KVM: Refactor stats descriptor generation macros
  KVM: Refactor designated initializer macros for struct _kvm_stats_desc
  KVM: Allow custom names for KVM_STAT()
  KVM: x86: Drop union for pages_{4k,2m,1g} stats

 arch/arm64/kvm/guest.c          |  14 +--
 arch/mips/kvm/mips.c            |  54 ++++-----
 arch/powerpc/kvm/book3s.c       |  62 +++++-----
 arch/powerpc/kvm/booke.c        |  48 ++++----
 arch/riscv/kvm/vcpu.c           |  16 +--
 arch/s390/kvm/kvm-s390.c        | 198 ++++++++++++++++----------------
 arch/x86/include/asm/kvm_host.h |   9 +-
 arch/x86/kvm/x86.c              |  94 +++++++--------
 include/linux/kvm_host.h        | 179 +++++++++++------------------
 9 files changed, 314 insertions(+), 360 deletions(-)


base-commit: 45dd9bc75d9adc9483f0c7d662ba6e73ed698a0b
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


