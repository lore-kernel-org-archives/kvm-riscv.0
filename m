From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:42 -0800
Subject: [RFC PATCH 22/37] KVM: x86: Select HAVE_TDP_MMU if X86_64
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-23-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation for moving the TDP MMU implementation into virt/kvm/
guarded behind HAVE_TDP_MMU, ensure that HAVE_TDP_MMU is selected in
X86_64 builds that enable KVM. This matches the existing behavior of the
TDP MMU in x86.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index fbeaa9ddef59..849185d5020d 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -49,6 +49,7 @@ config KVM
 	select SRCU
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
+	select HAVE_TDP_MMU if X86_64
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
-- 
2.39.0.rc1.256.g54fd8350bd-goog


