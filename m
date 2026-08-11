Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D26C5CFC1
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 23:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMTwP7Wfyuoq5DuxPVikJJ2UtQV/eHDfY7tOVlSc9AQ=; b=f6i2FnuHZwk7Vm
	ZWK03ZfoBRSVTl0QeMEZjElMZXE1enkiKslf57VBq639MUMvPGVSvT4+ddHmPhiXL0urtBzBYS0sA
	jHvmJNHQteRylG5pRsw69R496+0yRl7W6a19DhvtRk+MWS6/886U17quheqfQLAxkg2Q0032DmG7B
	EumdTFb3BIkY87QXfuNv8GV+HAraLyd7o2DltQ1/Ej+OqnmX7064tht5TSGlcvSaT708UD2DFxTcU
	7LxLj6gn/Ttz6ZVUmiGmhTPQDzeaFNeNI5TBXLG9rzWabPCKYVEGNuAcNz7vXuS0rRqItSA2g5M/C
	MakbereLfqRS+VYIPprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvVd-0000000F3fJ-1Gcn;
	Tue, 11 Aug 2026 23:03:49 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvVb-0000000F3eV-2oqF
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 23:03:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786489425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhSfHP9g04wYalHk7dBUvUUOdewrP/fVDAB8KJOgRKY=;
	b=sduuRLgqmPiCXoUyn5OGRz/tfB+r5Ky7gmSA3mHy31fSS+Yz7xfPDALsM/uOOm0gzOLpnO
	7F6n8yUdNsxs4Spu+FBmdV3W3nERR/tzpWUSA7Pcz5KtG6S87GocABKRYVL8ngSaFmpcKB
	VuGClGWJE+uzk0+csXlizPPaisOp5l8=
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v2 2/3] KVM: selftests: Add RISC-V Sv57 page table indexing
Date: Wed, 12 Aug 2026 07:03:15 +0800
Message-ID: <20260811230316.218770-3-jinyu.tang@linux.dev>
In-Reply-To: <20260811230316.218770-1-jinyu.tang@linux.dev>
References: <20260811230316.218770-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_160347_843615_BDFF0BA8 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

RISC-V selftests can create guests with five page-table levels, for
example when the selected guest mode is Sv57. The RISC-V page-table
walker only had index arrays for levels 0 through 3, so
virt_arch_pg_map() indexed past the end of the arrays when level 4 was
used.

Add the missing L4 index mask and shift so selftests can build guest
page tables for Sv57 VMs.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 3 +++
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index e3acf2ae9881..abde3c71c891 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -127,6 +127,9 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handl
 
 void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handler);
 
+/* L4 index Bit[56:48] */
+#define PGTBL_L4_INDEX_MASK			0x01FF000000000000ULL
+#define PGTBL_L4_INDEX_SHIFT			48
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
 #define PGTBL_L3_INDEX_SHIFT			39
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..b4d41a407553 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -43,6 +43,7 @@ static u64 pte_index_mask[] = {
 	PGTBL_L1_INDEX_MASK,
 	PGTBL_L2_INDEX_MASK,
 	PGTBL_L3_INDEX_MASK,
+	PGTBL_L4_INDEX_MASK,
 };
 
 static u32 pte_index_shift[] = {
@@ -50,6 +51,7 @@ static u32 pte_index_shift[] = {
 	PGTBL_L1_INDEX_SHIFT,
 	PGTBL_L2_INDEX_SHIFT,
 	PGTBL_L3_INDEX_SHIFT,
+	PGTBL_L4_INDEX_SHIFT,
 };
 
 static u64 pte_index(struct kvm_vm *vm, gva_t gva, int level)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
