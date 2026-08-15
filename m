Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A0CC5CFC1
	for <kvm-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4zOwWW75ekcmHgr5/oNwcLYI7d/4CKYMqAq6hrhGXc=; b=35AFOe97HgDAwZ
	zBbLIuFWZuo0ZFzB9dDBvAA6wNiDubG6d2YqicjzXTUDgW9zvYQMleofJ+nGqf4AJWPb2FzLdpJY0
	7bD71QNmka76oaWRrl0Tn0MW3db1m3tEoTkFi2AZ51PomFZ2okhb8ia4G7DGv8UEj5M01sT9BckNc
	XzhxqCXrWmct1N9SS/qj+SlB5354fcY0jrH/okaRAdEJn02iDI2/vWk7yyvChBllnX9MVn0H76pV/
	7vqmwAn6nWUfBmLEEFkvqVm+WhYk8eyoEVdlXiDaqB+jDDqQS8szFyf0OTmUOczlwsM+mpJWKvye+
	eyrqSpP8qXv1lOw87seg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBJZ-00000003jCi-22fH;
	Sat, 15 Aug 2026 10:08:33 +0000
Received: from out-122.mta0.migadu.com ([2001:41d0:1004:224b::7a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBJX-00000003jCM-05lq
	for kvm-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:08:32 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/XslhWPc8YWLKIGexGYeoNDF4BcQhquKIMzXN8FIw8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786788509; v=1; x=1787393309;
 b=pqBvvH7lG0tSBLZcanBS3+5GpjOd6Zn6+Vey8XhDQorIHdkReWTd1B4+fNdvIkXIx/3oWSk3
 3gn+QH/GWZWMym/eyhg7+zdefI+9IgsigZqo8eUBB11qrDuW6Ahg7/F3aZH3WziI4r3ikQbmkh7
 oPqwZFfEoe6U2hsv8dN5Ew10=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 6d2993df1b69e966;
	Sat, 15 Aug 2026 10:08:28 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Yifei Jiang <jiangyifei@huawei.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v4 4/5] KVM: selftests: Add RISC-V Sv57 page table indexing
Date: Sat, 15 Aug 2026 06:08:20 -0400
Message-ID: <20260815100820.862086-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815095548.860018-1-jinyu.tang@linux.dev>
References: <20260815095548.860018-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_030831_202023_30411689 
X-CRM114-Status: UNSURE (   8.32  )
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

Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
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
