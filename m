Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9121606A331
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sC9kxV/2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MDoVmDfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y2nwBIkK5gx/5ov74QaNcuHUd3Zxwwjs4aCxFuPa06Q=; b=sC9kxV/2b6cX7te9ZufT2fN+vv
	BvpLNiLb/cphfJ0I16G6aP8AdR/KwcYiMMW391WCunuvc+AtmQSBSN+gdRRgTHJDDnwmgEY+Lml5n
	0rvNLMJqfbiLGH4/2YF11gMK+muu0/rTyTGtZLtygfbO6wDz0+qu3aVKHHfIPrRVVF1wprZeQRoAh
	4gyvpp6OHecuy77ghxuJABxNOil8Uxkl/MxSjCF5NI7ygAjJ6kEhQlVPQpT/qxHG3GY4FhOsJkvmG
	czg1obGz7GKqvxT10ujNKHRhJsWVsZM5KoEX8BLB9UmkatYpg0aOh+cY/mYGHnL8vM22/+iWoHvKO
	5za7vuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyU-0000000Dvfr-1zU9;
	Fri, 13 Nov 2026 18:26:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyT-0000000Dvek-2af7
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=L0/xkeoaYWQSJNfGfg1c3/dC03KyiBSAIbTg/u+AAuc=; b=MDoVmDfFjbP858b/jFt58GtX4T
	Pxy1Co3vnlEUbk6lLShLJOcmUhsZrj4d9zQHs4e7mkpiMrPurWdpF9wqXbeKrEQWjptNTCF3XyqRT
	HgqxSr+qjqEk08qIbpPIVurxch4WPFz2iiIG6rIN9CB8J1ovmvuI8A0zghVqWjzGdyOtyrjJXZY2+
	Gwo7aOsrT0F6KzJ0IC2orRGtUs0Q3hK/bAIhDmLJaufaFUDNuUUjzWNwjNcIYk/oZ3ktc86/eIL1s
	EWY7sWZlLutzgIuBacYRikb5udeNwuxXAoe8MahzU7+lBv+p4k96n1QqjcoDIP/3NyhDuk6DfRHtz
	pLgKmx7g==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyR-00000004cSs-2gKx;
	Fri, 13 Nov 2026 18:26:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRvyR-00000000LXz-1tUE;
	Fri, 13 Nov 2026 18:26:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	Sriram Nambakam <snambakam@linux.microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [RFC PATCH 03/13] KVM: selftests: Add x86 planes lifecycle test
Date: Fri, 13 Nov 2026 11:25:57 -0700
Message-ID: <20261113182607.82813-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113182607.82813-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261113182607.82813-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Cover KVM_CAP_PLANES argument validation against the system fd's
ceiling, its split-irqchip and ordering requirements, plane creation
bounds, plane vCPU creation, and per-plane isolation of vCPU register
state. Skip on hosts that cannot give a VM more than one plane, such
as those without TDP.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/x86/planes_test.c | 137 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/planes_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index cdc6039d32d2..2926817baad0 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -111,6 +111,7 @@ TEST_GEN_PROGS_x86 += x86/nested_vmsave_vmload_test
 TEST_GEN_PROGS_x86 += x86/nested_x2apic_test
 TEST_GEN_PROGS_x86 += x86/platform_info_test
 TEST_GEN_PROGS_x86 += x86/plane_x86_test
+TEST_GEN_PROGS_x86 += x86/planes_test
 TEST_GEN_PROGS_x86 += x86/pmu_counters_test
 TEST_GEN_PROGS_x86 += x86/pmu_event_filter_test
 TEST_GEN_PROGS_x86 += x86/private_mem_conversions_test
diff --git a/tools/testing/selftests/kvm/x86/planes_test.c b/tools/testing/selftests/kvm/x86/planes_test.c
new file mode 100644
index 000000000000..f7db6cb6807d
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/planes_test.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test the KVM_CAP_PLANES opt-in and the plane lifecycle uAPI: plane
+ * creation bounds, plane vCPU creation, and the independence of
+ * per-plane vCPU register state.
+ */
+#include <errno.h>
+#include <string.h>
+
+#include "kvm_util.h"
+
+/*
+ * Whether this host lets a VM have more than one plane: the opt-in also
+ * fails without two-dimensional paging, which the system fd cannot show.
+ */
+static bool have_multiple_planes(void)
+{
+	struct kvm_vm *vm = vm_create_barebones_irqchip(true);
+	bool ok = !__vm_enable_cap(vm, KVM_CAP_PLANES, 2);
+
+	kvm_vm_free(vm);
+	return ok;
+}
+
+static void test_enable_cap_bounds(void)
+{
+	int max_planes = kvm_check_cap(KVM_CAP_PLANES);
+	struct kvm_vm *vm;
+
+	/* Planes require a split irqchip: without one the opt-in fails. */
+	vm = vm_create_barebones();
+	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, 2), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+	kvm_vm_free(vm);
+
+	/*
+	 * With one, the system fd's value is the most a VM may be given,
+	 * and a full in-kernel irqchip cannot replace the split one later.
+	 */
+	vm = vm_create_barebones_irqchip(true);
+
+	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, 0), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+
+	TEST_ASSERT(max_planes > 1 && max_planes <= KVM_MAX_PLANES,
+		    "system fd KVM_CAP_PLANES ceiling %d", max_planes);
+	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, max_planes + 1), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+
+	vm_enable_cap(vm, KVM_CAP_PLANES, max_planes);
+	TEST_ASSERT_EQ(vm_check_cap(vm, KVM_CAP_PLANES), max_planes);
+
+	/* ENOTTY where KVM_CREATE_IRQCHIP is compiled out (KVM_IOAPIC=n). */
+	TEST_ASSERT_EQ(__vm_ioctl(vm, KVM_CREATE_IRQCHIP, NULL), -1);
+	TEST_ASSERT(errno == EEXIST || errno == ENOTTY,
+		    "KVM_CREATE_IRQCHIP after the opt-in: errno %d", errno);
+
+	kvm_vm_free(vm);
+}
+
+static void test_enable_cap_too_late(void)
+{
+	struct kvm_vm *vm = vm_create_barebones_irqchip(true);
+
+	__vm_vcpu_add(vm, 0);
+
+	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, 2), -1);
+	TEST_ASSERT_EQ(errno, EEXIST);
+
+	kvm_vm_free(vm);
+}
+
+static void test_plane_lifecycle(void)
+{
+	struct kvm_vm *vm = vm_create_barebones();
+	struct kvm_plane_vcpu *vcpu1;
+	struct kvm_regs regs0, regs1;
+	struct kvm_plane *plane;
+	struct kvm_vcpu *vcpu0;
+	int r;
+
+	vm_enable_split_irqchip(vm);
+
+	/* Without the opt-in a VM has a single plane. */
+	TEST_ASSERT_EQ(vm_check_cap(vm, KVM_CAP_PLANES), 1);
+	TEST_ASSERT_EQ(__vm_ioctl(vm, KVM_CREATE_PLANE, (void *)1UL), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+
+	vm_enable_cap(vm, KVM_CAP_PLANES, 2);
+	TEST_ASSERT_EQ(vm_check_cap(vm, KVM_CAP_PLANES), 2);
+
+	/* The configured count is a hard bound, and reconfiguration a hard no. */
+	TEST_ASSERT_EQ(__vm_ioctl(vm, KVM_CREATE_PLANE, (void *)2UL), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+
+	plane = vm_plane_add(vm, 1);
+
+	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, 3), -1);
+	TEST_ASSERT_EQ(errno, EEXIST);
+
+	/* A plane fd takes plane ioctls only; capabilities are a VM matter. */
+	r = __plane_ioctl(plane, KVM_CHECK_EXTENSION, (void *)KVM_CAP_PLANES);
+	TEST_ASSERT(r == -1 && errno == ENOTTY,
+		    "KVM_CHECK_EXTENSION on a plane fd, expecting ENOTTY. ret: %d, errno: %d",
+		    r, errno);
+
+	vcpu0 = __vm_vcpu_add(vm, 0);
+	vcpu1 = __vm_plane_vcpu_add(vcpu0, plane);
+
+	/* Register state is per plane: write plane 1, plane 0 unaffected. */
+	plane_vcpu_ioctl(vcpu1, KVM_GET_REGS, &regs1);
+	regs1.rbx = 0x5157ca11;	/* arbitrary marker */
+	plane_vcpu_ioctl(vcpu1, KVM_SET_REGS, &regs1);
+
+	vcpu_ioctl(vcpu0, KVM_GET_REGS, &regs0);
+	TEST_ASSERT(regs0.rbx != 0x5157ca11,
+		    "plane 0 RBX changed by plane 1 KVM_SET_REGS");
+
+	memset(&regs1, 0, sizeof(regs1));
+	plane_vcpu_ioctl(vcpu1, KVM_GET_REGS, &regs1);
+	TEST_ASSERT_EQ(regs1.rbx, 0x5157ca11);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_PLANES));
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_SPLIT_IRQCHIP));
+	TEST_REQUIRE(have_multiple_planes());
+
+	test_enable_cap_bounds();
+	test_enable_cap_too_late();
+	test_plane_lifecycle();
+
+	return 0;
+}
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
