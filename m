From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:41 -0800
Subject: [RFC PATCH 21/37] KVM: Introduce CONFIG_HAVE_TDP_MMU
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-22-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a new config option to gate support for the common TDP MMU.
This will be used in future commits to avoid compiling the TDP MMU code
and avoid adding fields to common structs (e.g. struct kvm) on
architectures that do not support the TDP MMU yet.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 virt/kvm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 9fb1ff6f19e5..75d86794d6cf 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -92,3 +92,6 @@ config KVM_XFER_TO_GUEST_WORK
 
 config HAVE_KVM_PM_NOTIFIER
        bool
+
+config HAVE_TDP_MMU
+       bool
-- 
2.39.0.rc1.256.g54fd8350bd-goog


