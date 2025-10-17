Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7A0CCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:References
	:In-Reply-To:Date:Message-Id:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/t+8GgoLhnQ5CqMLTXAGJ8sjsdYCxMQ+8b2pA1U4+8=; b=icJieXFdAUPwt6
	IT86kGzc18C5mSGEdHn00d9ntrIemKZJU+vnZ73uhx8opukmJYPYuO6Z/muuBKcgvHEhdE3ejal9/
	gRb2WvOQ6iKwEz1L/ECViuPI6ZeyXvNh/MhlI4vf0rVl5t9tZRzrIC5HZ8rz6RsQlOHjzWAzabk5l
	TaViqkMfIYIDQl+Oe/BhstQ7KJ4Xyz9SjSwT2PLyG4X0hTxJZr5XimbWsmMYQvKFMnM6wlT0l91fY
	uhNa13QehCnFSkoDM77l5YvVZAMVoQIKnYtptZI2Ayn0i8TRcKaW4p45dT/QC/5wL5sH6PZTj6nPm
	Q/L1nqhlxbe9XCXi2LlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b0y-00000006SUF-2k6c;
	Fri, 17 Oct 2025 03:20:24 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b0v-00000006STs-1YCL
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:20:22 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4cnqnr58HKz5PM38;
	Fri, 17 Oct 2025 11:20:16 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 59H3JmWd056039;
	Fri, 17 Oct 2025 11:19:48 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl2.zte.com.cn with SMTP id 59H3FuQ3049940;
	Fri, 17 Oct 2025 11:15:56 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 17 Oct 2025 11:15:57 +0800 (CST)
Date: Fri, 17 Oct 2025 11:15:57 +0800 (CST)
X-Zmail-TransId: 2afb68f1b4ed771-63b55
X-Mailer: Zmail v1.0
In-Reply-To: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
References: 20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>, <ajones@ventanamicro.com>
Subject: =?UTF-8?B?W1BBVENIIDIvMl0gS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBEZXRlY3Qgc3VwcG9ydGVkIHZtIG1vZGVz?=
X-MAIL: mse-fl2.zte.com.cn 59H3JmWd056039
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 17 Oct 2025 11:20:16 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68F1B5F0.000/4cnqnr58HKz5PM38
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_202021_738405_85168E12 
X-CRM114-Status: GOOD (  15.46  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

The default vm mode on riscv is hardcoded to sv48, which causes tests to
fail on platform supporting sv39 only, such as '-cpu rva23s64' on qemu.
This patch detects the support vm modes and sets default to the maximum
supported one.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  4 ++-
 .../selftests/kvm/include/riscv/processor.h   |  2 ++
 tools/testing/selftests/kvm/lib/guest_modes.c | 24 +++++++++----
 .../selftests/kvm/lib/riscv/processor.c       | 36 +++++++++++++++++++
 4 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 02224bc514d4..7bc2ee9f0cad 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -234,7 +234,9 @@ extern enum vm_guest_mode vm_mode_default;
 #error "RISC-V 32-bit kvm selftests not supported"
 #endif

-#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
+extern enum vm_guest_mode vm_mode_default;
+
+#define VM_MODE_DEFAULT                        vm_mode_default
 #define MIN_PAGE_SHIFT                 12U
 #define ptes_per_page(page_size)       ((page_size) / 8)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 162f303d9daa..2d5a5548e698 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -191,4 +191,6 @@ static inline void local_irq_disable(void)
        csr_clear(CSR_SSTATUS, SR_SIE);
 }

+unsigned long riscv64_get_satp_mode(void);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
index 63d0d5479188..9c4a9e86223e 100644
--- a/tools/testing/selftests/kvm/lib/guest_modes.c
+++ b/tools/testing/selftests/kvm/lib/guest_modes.c
@@ -4,7 +4,7 @@
  */
 #include "guest_modes.h"

-#ifdef __aarch64__
+#if defined(__aarch64__) || defined(__riscv)
 #include "processor.h"
 enum vm_guest_mode vm_mode_default;
 #endif
@@ -13,9 +13,11 @@ struct guest_mode guest_modes[NUM_VM_MODES];

 void guest_modes_append_default(void)
 {
-#ifndef __aarch64__
+#if !defined(__aarch64__) && !defined(__riscv)
        guest_mode_append(VM_MODE_DEFAULT, true);
-#else
+#endif
+
+#ifdef __aarch64__
        {
                unsigned int limit = kvm_check_cap(KVM_CAP_ARM_VM_IPA_SIZE);
                uint32_t ipa4k, ipa16k, ipa64k;
@@ -74,10 +76,20 @@ void guest_modes_append_default(void)
 #ifdef __riscv
        {
                unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
+               unsigned long satp_mode = riscv64_get_satp_mode() << SATP_MODE_SHIFT;
+               int i;

-               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
-               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
-               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
+               guest_mode_append(VM_MODE_P56V57_4K, satp_mode >= SATP_MODE_57 && sz >= 59);
+               guest_mode_append(VM_MODE_P50V48_4K, satp_mode >= SATP_MODE_48 && sz >= 50);
+               guest_mode_append(VM_MODE_P41V39_4K, satp_mode >= SATP_MODE_39 && sz >= 41);
+
+               // set the first (maximum) supported mode as default
+               vm_mode_default = NUM_VM_MODES;
+               for (i = 0; vm_mode_default == NUM_VM_MODES && i < NUM_VM_MODES; i++) {
+                       if (guest_modes[i].supported && guest_modes[i].enabled)
+                               vm_mode_default = i;
+               }
+               TEST_ASSERT(vm_mode_default != NUM_VM_MODES, "No supported mode!");
        }
 #endif
 }
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index de84c092f982..eac67cb21f50 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -8,6 +8,7 @@
 #include <linux/compiler.h>
 #include <assert.h>

+#include "guest_modes.h"
 #include "kvm_util.h"
 #include "processor.h"
 #include "ucall_common.h"
@@ -528,3 +529,38 @@ unsigned long get_host_sbi_spec_version(void)

        return ret.value;
 }
+
+void kvm_selftest_arch_init(void)
+{
+       /*
+        * riscv64 doesn't have a true default mode, so start by detecting the
+        * supported vm mode.
+        */
+       guest_modes_append_default();
+}
+
+unsigned long riscv64_get_satp_mode(void)
+{
+       int kvm_fd, vm_fd, vcpu_fd, err;
+       uint64_t val;
+       struct kvm_one_reg reg = {
+               .id     = RISCV_CONFIG_REG(satp_mode),
+               .addr   = (uint64_t)&val,
+       };
+
+       kvm_fd = open_kvm_dev_path_or_exit();
+       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
+       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
+
+       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
+       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
+
+       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
+       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, vcpu_fd));
+
+       close(vcpu_fd);
+       close(vm_fd);
+       close(kvm_fd);
+
+       return val;
+}
--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
