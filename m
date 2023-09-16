From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:31:00 -0700
Subject: [PATCH 08/26] KVM: x86: Stop selecting and depending on HAVE_KVM
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-9-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that nothing in x86 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in x86.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/Kconfig     | 1 -
 arch/x86/kvm/Kconfig | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 982b777eadc7..32eb288a4e3a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -240,7 +240,6 @@ config X86
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_KRETPROBES
 	select HAVE_RETHOOK
-	select HAVE_KVM
 	select HAVE_LIVEPATCH			if X86_64
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 0f01e5600b5f..8c5fb7f57b4c 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -7,7 +7,6 @@ source "virt/kvm/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
-	depends on HAVE_KVM || X86
 	default y
 	help
 	  Say Y here to get to see options for using your Linux host to run other
@@ -20,7 +19,6 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	depends on HIGH_RES_TIMERS
 	depends on X86_LOCAL_APIC
 	select PREEMPT_NOTIFIERS
-- 
2.42.0.459.ge4e396fd5e-goog


