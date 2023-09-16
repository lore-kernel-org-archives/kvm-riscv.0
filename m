From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:31:02 -0700
Subject: [PATCH 10/26] KVM: s390: Stop selecting and depending on HAVE_KVM
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-11-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that nothing in s390 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in s390.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/Kconfig     | 1 -
 arch/s390/kvm/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ae29e4392664..8a5dca0036d9 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -193,7 +193,6 @@ config S390
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-	select HAVE_KVM
 	select HAVE_LIVEPATCH
 	select HAVE_MEMBLOCK_PHYS_MAP
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 459d536116a6..9056cee72945 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -19,7 +19,6 @@ if VIRTUALIZATION
 config KVM
 	def_tristate y
 	prompt "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-- 
2.42.0.459.ge4e396fd5e-goog


